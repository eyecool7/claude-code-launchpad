# Launchpad 플러그인 기술 결정 로그

## 2026-03-05: refine 갭 분석 #2 "사용자 플로우 완전성"으로 보강
- **결정**: 기존 "사용자 판단 지점" 기준을 "사용자 플로우 완전성"으로 교체
- **이유**: 카드뉴스 미리보기가 누락된 채 빌드 통과 — 입력→처리만 있고 결과 확인→후속 액션이 검증되지 않았음
- **변경**: 입력→처리→결과 확인→후속 액션 4단계 플로우 검증 + 유사 기능 간 대칭성 체크 추가
- **커밋**: 47f7456
- **관련 파일**: `plugins/launchpad/templates/project-refine-prompt.md`

## 2026-03-05: refine 갭 분석 #7 "항목-완료기준 정합성" 추가
- **결정**: 갭 분석 기준에 "항목 설명과 완료 기준의 정합성 확인" 항목 추가
- **이유**: Phase 항목이 "DALL-E 3 이미지 생성"인데 완료 기준은 "JSON 출력" — 구현 범위가 축소되어 이미지 생성 누락
- **변경**: 항목이 "X를 구현"이면 완료 기준에도 X 동작 검증이 포함되어야 함
- **커밋**: 47f7456
- **관련 파일**: `plugins/launchpad/templates/project-refine-prompt.md`

## 2026-03-05: build Step 8 실행 프로토콜 추가
- **결정**: build.md에 Tier별 실행 프로토콜(Step 8) 추가
- **이유**: 승인 후 실행에 대한 지시가 한 줄("코딩을 시작한다")뿐이라 Tier 2/3도 Tier 1처럼 직렬 실행됨
- **변경**: Tier 1 순차, Tier 2 서브에이전트 병렬 위임, Tier 3 worktree 격리 분기
- **커밋**: 44baa9e
- **관련 파일**: `plugins/launchpad/commands/build.md`

## 2026-03-05: build 검증 실패 2회 중단 규칙 + 서브에이전트 decisions 전달
- **결정**: 검증 2회 연속 실패 시 자동 중단 + 서브에이전트에 decisions.md 컨텍스트 전달
- **이유**: 검증 실패 시 행동이 미정의되어 무한 루프 가능성, 서브에이전트가 기존 기술 결정을 모른 채 작업
- **커밋**: 44baa9e
- **관련 파일**: `plugins/launchpad/commands/build.md`

## 2026-03-05: /launchpad:design 커맨드 신설
- **결정**: setup과 build 사이에 디자인 토큰 수립 커맨드 추가
- **이유**: 프론트엔드 프로젝트에서 디자인 방향이 정해지지 않은 채 빌드 진입 — 무색 화이트/블랙 기본값으로 UI 생성됨
- **변경**: 브라우저 기반 인터랙티브 컨피규레이터(HTML) → 실시간 프리뷰 → design-tokens.md 생성
- **커밋**: 3e70495
- **관련 파일**: `plugins/launchpad/commands/design.md`

## 2026-03-05: 디자인 스킬 조합 확정
- **결정**: frontend-design + impeccable + theme-factory 3개 스킬 조합 사용
- **이유**: 기존 ui-ux-pro-max는 범위가 너무 넓고, design-rules는 토큰에 통합 가능. impeccable이 17개 전문 커맨드로 더 세분화된 디자인 지원
- **영향**: setup.md에서 ui-ux-pro-max 무조건 설치 정책은 향후 impeccable로 교체 검토
- **관련 파일**: `plugins/launchpad/commands/design.md`

## 2026-03-05: 디자인 컨피규레이터 인터랙티브 HTML 방식 채택
- **결정**: AskUserQuestion 텍스트 선택 대신 브라우저 기반 라이브 프리뷰 컨피규레이터 사용
- **이유**: 디자인은 텍스트 설명만으로 판단 불가. 컬러·폰트·모션을 눈으로 보면서 조합해야 함
- **변경**: 단일 HTML 파일(Google Fonts CDN만 의존) 생성 → 좌우 분할(컨트롤+프리뷰) → 확정 시 JSON 출력
- **관련 파일**: `plugins/launchpad/commands/design.md`

## 2026-03-05: 액션 피드백 패턴 3단계 체계 도입
- **결정**: 버튼 클릭 후 상태 표현을 Minimal/Standard/Rich 3단계로 정의
- **이유**: 현재 프로젝트에서 버튼 클릭 후 시각적 피드백이 전혀 없어 사용자가 동작 여부를 인지 못함
- **변경**: design-tokens.md에 Action Feedback 섹션 추가, 컨피규레이터에서 데모 버튼으로 시연
- **관련 파일**: `plugins/launchpad/commands/design.md`

## 2026-03-05: /launchpad:design을 Personality 기반 시스템으로 전면 재설계
- **결정**: CSS 변수 컨피규레이터 방식을 폐기하고, Design Personality → 안전 조정 → design-rules 생성 방식으로 교체
- **이유**: CSS 값(#0693E3, shadow 8px)은 Claude Code가 판단 기준으로 쓰기 어려움. "어떻게 짜야 하는가"를 판단하는 규칙 파일이 필요. 또한 개별 속성을 자유 조합하면 디자인이 망가질 수 있어서, Personality별로 잠금/조정을 분리하여 "어떻게 조합해도 괜찮은 것들"만 열어줌
- **변경**: design.md 커맨드 전면 재작성 + `templates/design-rules/` 하위에 5개 Personality × 6개 파일 = 30개 템플릿 생성
- **구조**:
  - Level 1: Personality 선택 (Editorial Authority / Brutalist Raw / Tech Precision / Organic Warm / Luxury Minimal)
  - Level 2: 각 Personality 안 3가지 안전 조정 (잠금 항목은 불변)
  - Level 3: 브랜드색 오버라이드 + 다크모드
- **출력**: `.claude/skills/design-rules/` 디렉토리에 00-personality ~ 05-components 6개 마크다운 파일
- **관련 파일**: `plugins/launchpad/commands/design.md`, `plugins/launchpad/templates/design-rules/`
