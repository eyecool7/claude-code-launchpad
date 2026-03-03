---
description: 전체 워크플로우 안내. 처음 사용 시 먼저 실행. guide, 가이드, 도움말, 시작, 처음, help, start, 안내 시 사용.
---

# Launchpad 가이드

사용자에게 다음을 출력한다:

---

## Claude Code Launchpad

바이브 코더를 위한 컨텍스트 최적화 워크플로우

Optimized PBS 하나로 프로젝트 맞춤 계획(Plan)부터 구축(Build), 보안(Shield)까지 원스톱으로.

### 워크플로우

| # | 명령어 | 하는 일 | 소요 |
|---|--------|---------|------|
| 0 | `/launchpad:guide` | 워크플로우 안내 (지금 여기) | 1분 |
| 1 | `/launchpad:plan` | 계획서 작성 프롬프트 생성 → claude.ai에서 완성 | 15분 |
| 2 | `/launchpad:refine` | 기술 심화 + 스킬/MCP 자동 검색 | 10분 |
| 3 | `/launchpad:setup` | CLAUDE.md + 설정 파일 자동 생성 | 3분 |
| 4 | `/launchpad:build` | 매 세션 시작 시 실행. 현황 분석 + 구축 계획 | 1분 |

### 생성되는 것들

**Plan (계획)**
- CLAUDE.md — 프로젝트 매뉴얼 (~80줄)
- Rules + Skills — 코딩 컨벤션, 에러 처리, 리팩토링 가이드
- decisions.md + lessons.md — 세션 간 연속성 보장

**Build (구축)**
- 에이전트 — 기본 3개(테스트/리뷰/디버깅) + 플랜 평가 후 필요 시 커스텀 추가
- Commands — /check, /review, /commit-push-pr
- Phase별 구축 가이드 — TDD 적용 여부 자동 판정

**Shield (보안)**
- 보안 훅 7개 — API 키 유출 방지, 위험 명령 차단, 민감 파일 감시, DB 보호
- /security — CWE Top 25 기반 보안 스캔
- pre-commit 검증 — 커밋 전 typecheck + lint + test 자동 실행

**시작하려면** `/launchpad:plan`을 입력하세요.

---

**중요: 위 내용만 출력. 추가 설명이나 질문 없이 안내만 전달.**
