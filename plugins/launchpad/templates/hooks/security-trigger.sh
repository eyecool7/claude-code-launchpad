#!/bin/bash
# PostToolUse hook — 민감 파일 수정 시 보안 리뷰 알림
# Write|Edit 도구로 인증/결제/암호화 관련 파일을 수정하면 경고를 출력한다.

INPUT=$(cat)

if ! command -v jq &>/dev/null; then
  exit 0
fi

FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.path // empty' 2>/dev/null)
if [ -z "$FILE_PATH" ]; then
  exit 0
fi

FILENAME=$(basename "$FILE_PATH")
DIRPATH=$(dirname "$FILE_PATH")

TRIGGERED=""

# 인증 관련 파일
if echo "$FILE_PATH" | grep -qiE '(auth|login|signup|session|token|oauth|jwt|credential|password|passport)'; then
  TRIGGERED="인증/인가 (Authentication)"
fi

# 결제 관련 파일
if echo "$FILE_PATH" | grep -qiE '(payment|billing|checkout|stripe|subscription|invoice|charge)'; then
  TRIGGERED="결제 (Payment)"
fi

# 암호화/보안 관련 파일
if echo "$FILE_PATH" | grep -qiE '(crypto|encrypt|decrypt|hash|secret|\.pem|\.key|security|firewall|cors)'; then
  TRIGGERED="암호화/보안 (Security)"
fi

# 환경 설정 파일
if echo "$FILENAME" | grep -qiE '^\.env|^config\.(prod|production)|^secrets\.'; then
  TRIGGERED="환경 설정 (Config)"
fi

if [ -n "$TRIGGERED" ]; then
  echo ""
  echo "🔐 민감 파일 수정 감지: $TRIGGERED"
  echo "   파일: $FILE_PATH"
  echo "   → 변경사항이 보안에 영향을 주는지 검토하세요."
  echo "   → 필요 시 /launchpad:security 로 보안 스캔을 실행하세요."
  echo ""
fi

exit 0
