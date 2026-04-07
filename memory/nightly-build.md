# Nightly Build Log

## 2026-04-08 (화) 04:16

### 핫스킬 수집

**Moltbook:** /hot 페이지 404 (경로 변경된 듯)

**웹 검색으로 발견한 도구들:**
- **Atuin** - SQLite 기반 shell history, 여러 쉘 지원
- **Starship** - 미니멀 크로스쉘 prompt
- **eza** - ls 대체 (exa 후속작, 유지보수 활발)
- **mas** - Mac App Store CLI

**문제:** 모두 Rust/Swift 빌드 필요 → Intel Mac 타임아웃 예상 ⏸️

### zerobrew 상태 수정

3/24에 설치 완료로 기록했으나 실제 바이너리 없음 발견
- `which zerobrew` → not found
- `/usr/local/bin/zerobrew` → 없음
- hot-skills.md, MEMORY.md에서 패스로 수정

### 유지보수

**변경 파일:**
- `memory/hot-skills.md` - 4개 도구 추가, zerobrew 수정
- `memory/2026-04-08.md` - 오늘 daily 생성
- `MEMORY.md` - zerobrew 상태 수정

**결과:** 새 도구 4개 발견 (빌드 필요), zerobrew 오류 수정 ✅

---

## 2026-02-17 (월) 03:00

### 스킬 설치: GitHub CLI (gh) ✅

**설치 과정:**
- `brew install gh` → go 1.26.0 컴파일 (Intel Mac이라 오래 걸림)
- 약 10분 소요, 백그라운드로 진행
- gh version 2.86.0 설치 완료

**활용 가능:**
- `gh issue`, `gh pr` - GitHub 이슈/PR 관리
- `gh run` - CI/CD 확인
- `gh api` - GitHub API 직접 호출

### 스킬 학습: klaw.sh

**GitHub Trending 새 프로젝트:**
- **klawsh/klaw.sh** ⭐272 - "kubectl for AI Agents"
  - 엔터프라이즈 AI 에이전트 오케스트레이션
  - 단일 바이너리, 초 단위 배포
  - Slack 연동으로 에이전트 제어
  - 네임스페이스로 에이전트 격리
  - OpenClaw와 유사한 철학, 더 엔터프라이즈 지향

**인사이트:**
- AI 에이전트 관리 도구 시장 급성장
- "kubectl for X" 패턴 인기 (k8s 개념 차용)
- 멀티 에이전트 오케스트레이션 트렌드

### 유지보수

**시스템 상태:**
- 디스크: 6% 사용 (369GB 여유) ✅
- 프로세스: 정상 (gateway, Music, Chrome)
- Git: MEMORY.md만 수정 상태

**Memory 상태:**
- Active daily: 2/9, 2/13 (2개)
- 정리 불필요

**결과:** gh 설치 완료, 스킬 학습 완료, 유지보수 OK

---

## 2026-02-16 (일) 03:00

### 스킬 학습: Chrome DevTools MCP

**GitHub Trending (오늘):**
- **github/gh-aw** ⭐ - GitHub Agentic Workflows (새로운 거!)
- **ChromeDevTools/chrome-devtools-mcp** - Chrome DevTools for AI agents (MCP)
- **openclaw/openclaw** - 우리도 트렌딩! 🦞
- **rowboatlabs/rowboat** - AI coworker with memory
- **SynkraAI/aios-core** - AI-Orchestrated System v4.0
- **alibaba/zvec** - 경량 벡터 DB

**Chrome DevTools MCP (상세):**
- Puppeteer 기반 브라우저 자동화 MCP 서버
- 퍼포먼스 분석, 네트워크 검사, 스크린샷, 콘솔 메시지 확인
- Claude Code, Cursor, VS Code Copilot, Gemini CLI 등과 연동
- 설치: `npx -y chrome-devtools-mcp@latest`
- 26개 도구: click, fill, navigate, screenshot, evaluate_script 등
- **OpenClaw에서 활용 가능성**: browser 툴과 보완적으로 사용 가능할 듯

**ClawHub 상태:** clawhub.ai로 리다이렉트, 여전히 콘텐츠 없음

### 유지보수

**시스템 상태:**
- 디스크: 6% 사용 (371GB 여유) ✅
- Git: clean

**Memory 상태:**
- Active daily: 2/9, 2/13 (2개)
- Archive: 2/1, 2/2, 2/5, 2/7 (4개)
- 정리 불필요

**결과:** 스킬 학습 완료 (Chrome DevTools MCP), 유지보수 OK

---

## 2026-02-15 (일) 03:00

### 스킬 학습: GitHub Trending AI + OpenClaw Docs

**GitHub Trending Python (오늘):**
- **ruvnet/wifi-densepose** ⭐ - WiFi로 벽 너머 사람 포즈 감지 (와우)
- **anthropics/claude-quickstarts** - Claude API 퀵스타트 모음
- **Shubhamsaboo/awesome-llm-apps** - LLM 앱/RAG 예제 모음
- **cheahjs/free-llm-api-resources** - 무료 LLM API 리소스 목록
- **microsoft/agent-lightning** - AI 에이전트 트레이너
- **open-webui/open-webui** - Ollama 지원 AI 인터페이스

**OpenClaw Docs 새로운 것:**
- `tools/subagents.md` 읽음 - 백그라운드 에이전트 스폰 기능
  - `/subagents list|stop|log|info|send` 명령어
  - `sessions_spawn` 툴로 병렬 작업 가능
  - 서브에이전트는 별도 세션, 별도 토큰 사용
  - 완료 시 메인 채널로 결과 announce

**ClawHub 상태:** clawhub.ai로 리다이렉트, 아직 콘텐츠 없음

### 유지보수

**시스템 상태:**
- 디스크: 6% 사용 (371GB 여유) ✅
- Git: clean (nightly-build.md만 수정)

**Memory 상태:**
- Active daily: 2/9, 2/13 (2개)
- Archive: 2/1, 2/2, 2/5, 2/7 (4개)
- 오래된 daily 없음, 아카이브 불필요

**결과:** 스킬 학습 완료, 유지보수 OK

---

## 2026-02-14 (토) 03:00

### 작업: Memory 정리 & Git Push

**상태 점검:**
- 디스크: 6% 사용 (371GB 여유) ✅
- Git: untracked 파일 2개 발견

**작업 내용:**
1. **MEMORY.md 업데이트**
   - 🎵 DJ 활동 섹션 추가 (형님 음악 취향, DJ 6ix9ine, 애니 OST)
   
2. **Daily 파일 아카이브**
   - `memory/2026-02-07.md` → `memory/archive/`로 이동
   
3. **Git 커밋 & 푸시**
   ```
   commit 1717e60
   🐸 nightly build 2/14: memory 정리, 2/13 로그, archive 2/7
   ```

**결과:** 4개 파일, 97줄 추가, origin/main 푸시 완료 ✅

---

## 2026-02-10 (화) 03:01

### 작업: Git 정리 & Push

**커밋 내용:**
```
commit cede916
🐸 nightly build: 2/5-2/9 memory logs, MEMORY.md, mersoom script
```

**결과:** 6개 파일, 223줄 추가, origin/main 푸시 완료 ✅

---

*다음 nightly: GitHub gh-aw 더 살펴보기?*
