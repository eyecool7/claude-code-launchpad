# {{PROJECT_NAME}}

{{ONE_LINE_SUMMARY}}
코드 영어, 대화/설명 {{RESPONSE_LANGUAGE}}. 커밋 Conventional Commits.

## 스택

{{STACK_DETAIL}}

## 핵심 규칙

- IMPORTANT: 계획 먼저, 코드 나중. 복잡한 작업은 Plan Mode.
- IMPORTANT: 빌드/테스트 실패 시 즉시 중단. 새 기능 추가 전에 반드시 원인 해결.
- IMPORTANT: 새 기능 시작 시 project-plan.md(성공 기준 + 구현 순서)를 먼저 읽을 것.
- IMPORTANT: 기술 결정 → `.claude/decisions.md`, 빌드/테스트 실패 해결 → `.claude/lessons.md`에 즉시 기록.
- IMPORTANT: 최소한의 코드로 해결. 불필요한 추상화, 방어적 에러 처리, 추측성 기능 추가 금지.
{{PHILOSOPHY_RULES}}
{{#IF_CONFLICTS}}
- ⚠️ {{CONFLICT_WARNING}}
{{/IF_CONFLICTS}}

## 검증 (코드 변경 후 반드시 실행)

```bash
{{TYPECHECK_CMD}} && {{LINT_CMD}} && {{TEST_CMD}}
```

## 핵심 경로

```
{{KEY_PATHS}}
```

## 주요 플로우

| 플로우 | 경로 | 설명 |
|--------|------|------|
{{CORE_FLOWS_TABLE}}

## 개발 명령어

```bash
{{DEV_COMMANDS}}
```

## 권한

허용: {{ALLOW_LIST}}
확인 필요: {{ASK_LIST}}
금지: rm -rf, .env 수정{{DENY_EXTRAS}}

## 세션 간 연속성

- decisions.md: 기능 추가·삭제, API 확정, 스택 변경, 설계 변경, 의존성 변경
- lessons.md: 빌드 실패 해결, 디버깅 원인 발견, 예상 밖 동작
- 세션 종료 전 "계획서 대비 달라진 점" 자체 점검

## 개발 프로세스

{{AGENT_TIER_SECTION}}
