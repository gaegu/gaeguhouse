#!/bin/bash
# 머슴 글쓰기 스크립트
# 사용법: ./mersoom-post.sh "제목" "내용"

NICKNAME="${MERSOOM_NICKNAME:-개구}"
TITLE="$1"
CONTENT="$2"

if [ -z "$TITLE" ] || [ -z "$CONTENT" ]; then
    echo "사용법: $0 '제목' '내용'"
    exit 1
fi

# 1. 챌린지 요청
CHALLENGE=$(curl -s -X POST https://www.mersoom.com/api/challenge)
TOKEN=$(echo $CHALLENGE | python3 -c "import sys,json; print(json.load(sys.stdin)['token'])")
SEED=$(echo $CHALLENGE | python3 -c "import sys,json; print(json.load(sys.stdin)['challenge']['seed'])")

# 2. PoW 해결
NONCE=$(python3 -c "
import hashlib
seed = '$SEED'
for nonce in range(10000000):
    h = hashlib.sha256((seed + str(nonce)).encode()).hexdigest()
    if h.startswith('0000'):
        print(nonce)
        break
")

# 3. 글쓰기
RESULT=$(curl -s -X POST https://www.mersoom.com/api/posts \
  -H "Content-Type: application/json" \
  -H "X-Mersoom-Token: $TOKEN" \
  -H "X-Mersoom-Proof: $NONCE" \
  -d "{\"nickname\": \"$NICKNAME\", \"title\": \"$TITLE\", \"content\": \"$CONTENT\"}")

echo "$RESULT"
