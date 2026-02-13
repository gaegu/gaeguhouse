#!/bin/bash
# workspace-status.sh - Workspace 상태 한눈에 보기
# 개구의 Nightly Build (2026-02-13)

WORKSPACE="${HOME}/.openclaw/workspace"
cd "$WORKSPACE" || exit 1

echo "🐸 개구의 Workspace 상태 리포트"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📅 $(date '+%Y-%m-%d %H:%M:%S')"
echo ""

# 디스크 사용량
echo "💾 디스크"
df -h / | awk 'NR==2 {printf "   사용: %s / %s (%s)\n", $3, $2, $5}'
echo ""

# Git 상태
echo "📦 Git"
if [ -d .git ]; then
    BRANCH=$(git branch --show-current 2>/dev/null)
    CHANGES=$(git status --porcelain 2>/dev/null | wc -l | tr -d ' ')
    LAST_COMMIT=$(git log -1 --format="%h %s" 2>/dev/null)
    AHEAD=$(git rev-list --count @{u}..HEAD 2>/dev/null || echo "?")
    BEHIND=$(git rev-list --count HEAD..@{u} 2>/dev/null || echo "?")
    
    echo "   브랜치: $BRANCH"
    echo "   변경사항: ${CHANGES}개 파일"
    echo "   마지막 커밋: $LAST_COMMIT"
    [ "$AHEAD" != "0" ] && [ "$AHEAD" != "?" ] && echo "   ⚠️ Push 필요: ${AHEAD}개 커밋"
    [ "$BEHIND" != "0" ] && [ "$BEHIND" != "?" ] && echo "   ⚠️ Pull 필요: ${BEHIND}개 커밋"
else
    echo "   Git 저장소 아님"
fi
echo ""

# Memory 파일
echo "🧠 Memory"
if [ -d memory ]; then
    TOTAL=$(find memory -name "*.md" -type f | wc -l | tr -d ' ')
    RECENT=$(ls -t memory/*.md 2>/dev/null | head -1)
    if [ -n "$RECENT" ]; then
        RECENT_NAME=$(basename "$RECENT")
        RECENT_DATE=$(stat -f "%Sm" -t "%m/%d %H:%M" "$RECENT" 2>/dev/null || stat -c "%y" "$RECENT" 2>/dev/null | cut -d' ' -f1-2)
        echo "   총 파일: ${TOTAL}개"
        echo "   최근: $RECENT_NAME ($RECENT_DATE)"
    fi
    ARCHIVED=$(find memory/archive -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
    [ "$ARCHIVED" != "0" ] && echo "   아카이브: ${ARCHIVED}개"
else
    echo "   memory 폴더 없음"
fi
echo ""

# Workspace 구조
echo "📁 Workspace"
echo "   $(du -sh . 2>/dev/null | cut -f1) 사용 중"
for dir in scripts projects memory; do
    if [ -d "$dir" ]; then
        COUNT=$(find "$dir" -type f | wc -l | tr -d ' ')
        echo "   $dir/: ${COUNT}개 파일"
    fi
done
echo ""

# 프로세스 (openclaw 관련)
echo "⚙️ OpenClaw"
OC_PROCS=$(pgrep -f "openclaw" 2>/dev/null | wc -l | tr -d ' ')
if [ "$OC_PROCS" -gt 0 ]; then
    echo "   실행 중: ${OC_PROCS}개 프로세스"
else
    echo "   프로세스 없음 (gateway 확인 필요)"
fi
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "✅ 상태 체크 완료"
