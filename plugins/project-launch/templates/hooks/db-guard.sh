#!/bin/bash
# PreToolUse hook — MCP 도구를 통한 파괴적 SQL 차단
# DROP TABLE, TRUNCATE, DELETE without WHERE 등을 감지하여 차단한다.
# 조건부: DB 사용 프로젝트에서만 설치.

INPUT=$(cat)

if ! command -v jq &>/dev/null; then
  exit 0
fi

# MCP 도구의 입력에서 SQL 쿼리 추출
# tool_input의 query, sql, statement 등 다양한 키를 탐색
QUERY=$(echo "$INPUT" | jq -r '
  .tool_input.query //
  .tool_input.sql //
  .tool_input.statement //
  .tool_input.command //
  empty
' 2>/dev/null)

if [ -z "$QUERY" ]; then
  exit 0
fi

# 대소문자 무시를 위해 대문자로 변환
UPPER_QUERY=$(echo "$QUERY" | tr '[:lower:]' '[:upper:]')

BLOCKED=""

# DROP TABLE / DROP DATABASE
if echo "$UPPER_QUERY" | grep -qE 'DROP\s+(TABLE|DATABASE|SCHEMA|INDEX)'; then
  BLOCKED="DROP (테이블/데이터베이스/스키마 삭제)"
fi

# TRUNCATE
if echo "$UPPER_QUERY" | grep -qE 'TRUNCATE\s+'; then
  BLOCKED="TRUNCATE (전체 데이터 삭제)"
fi

# DELETE without WHERE
if echo "$UPPER_QUERY" | grep -qE 'DELETE\s+FROM' && ! echo "$UPPER_QUERY" | grep -qE 'WHERE'; then
  BLOCKED="DELETE without WHERE (전체 행 삭제)"
fi

# UPDATE without WHERE
if echo "$UPPER_QUERY" | grep -qE 'UPDATE\s+' && echo "$UPPER_QUERY" | grep -qE 'SET\s+' && ! echo "$UPPER_QUERY" | grep -qE 'WHERE'; then
  BLOCKED="UPDATE without WHERE (전체 행 수정)"
fi

# ALTER TABLE DROP COLUMN
if echo "$UPPER_QUERY" | grep -qE 'ALTER\s+TABLE.*DROP\s+COLUMN'; then
  BLOCKED="ALTER TABLE DROP COLUMN (컬럼 삭제)"
fi

if [ -n "$BLOCKED" ]; then
  echo ""
  echo "🛑 파괴적 SQL 차단!"
  echo "   유형: $BLOCKED"
  echo "   쿼리: $QUERY"
  echo ""
  echo "   데이터 손실 위험이 있는 쿼리입니다."
  echo "   정말 필요한 경우 사용자에게 직접 실행을 요청하세요."
  echo ""
  exit 2
fi

exit 0
