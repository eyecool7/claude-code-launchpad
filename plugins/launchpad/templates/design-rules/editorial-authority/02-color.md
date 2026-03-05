# Color — Editorial Authority

## 핵심 원칙

색은 의미다. 장식을 위한 색은 존재하지 않는다.
모노크롬 기반에 단 하나의 Accent만 허용한다. 그 Accent가 쓰인 곳은 반드시 이유가 있어야 한다.

## 팔레트 구조

```
Background  → 가장 넓은 면적, 시선의 기본값
Surface     → 카드, 패널, 인풋 배경
Border      → 구조를 암시하는 선
Text        → 읽기 위한 것
Accent      → 행동 유도, 강조 (1색만)
```

## 기본 팔레트: Cool Gray

| 역할 | 값 | 비고 |
|------|-----|------|
| Background | #FFFFFF | 기본 배경 |
| Surface | #F0F2F5 | 카드, 사이드바 |
| Border | #E2E5EA | 구분선, 인풋 테두리 |
| Text Primary | #0F1117 | 제목, 본문 |
| Text Secondary | #6B7280 | 캡션, 보조 텍스트 |
| Text Disabled | #9CA3AF | 비활성 상태 |

## 대안 팔레트: Cream

| 역할 | 값 | 비고 |
|------|-----|------|
| Background | #FAF8F5 | 따뜻한 화이트 |
| Surface | #F2EDE6 | 크림 톤 |
| Border | #E0D8CE | 따뜻한 회색 |
| Text Primary | #1A1408 | 거의 블랙 |
| Text Secondary | #7A7062 | |
| Text Disabled | #A89E90 | |

## Accent 색 규칙

Accent는 프로젝트당 **1개만** 선택한다.

```css
/* 예시: Vermillion */
--accent: #E63B2E;
--accent-hover: #CC3428;

/* 예시: Deep Blue */
--accent: #1A3A6B;
--accent-hover: #152E55;

/* 예시: Black (무채색 Accent) */
--accent: #0F1117;
--accent-hover: #000000;
```

## Accent 사용 규칙

```
쓸 수 있는 곳:
- Primary CTA 버튼 배경
- Active 탭 / 네비게이션 언더라인
- 인용문 왼쪽 보더
- 카테고리 태그 (1개까지)
- 링크 색 (hover 시만)

쓰면 안 되는 곳:
- 배경 전체
- 일반 텍스트 색
- 2개 이상의 요소에 동시 사용 (한 뷰포트 안에서)
- 그라디언트의 일부
```

## 상태 색 (시스템 전용)

```css
--error:   #DC2626; /* 에러 텍스트, 테두리에만 */
--success: #0F1117; /* 텍스트 + 체크 아이콘으로 표현 */
--warning: #0F1117; /* 텍스트 + 아이콘으로 표현 */
--info:    [Accent]; /* 인용문 스타일 보더 */
```

Editorial에서 상태는 **색이 아니라 텍스트와 아이콘**으로 전달한다.
Success에 초록 배경, Warning에 노란 배경을 사용하지 않는다.

## Claude에게

한 화면에 Accent 색이 2곳 이상 보이면 하나를 제거하라.
중간 톤 회색(#888 근처)은 텍스트 계층이 흐려지므로 피한다.
