# Color — Luxury Minimal

## 핵심 원칙

색은 거의 없다. 흑과 백, 그리고 침묵.
Accent가 나타나면 그것은 Gold 또는 Silver뿐이다.
색이 적을수록 고급스럽다.

## 팔레트 구조

```
Background  → 순수 화이트 또는 거의 검정
Text        → Background의 반대
Accent      → Gold 또는 Silver (선택)
Border      → 극도로 연한 구분선
```

## 팔레트 옵션 A: Pure White

| 역할 | 값 | 비고 |
|------|-----|------|
| Background | #FFFFFF | 순수 화이트 |
| Surface | #FAFAFA | 거의 구분 안 되는 차이 |
| Border | #E5E5E5 | 극히 연한 |
| Text Primary | #0A0A0A | 거의 검정 |
| Text Secondary | #737373 | |
| Text Disabled | #A3A3A3 | |

## 팔레트 옵션 B: Off-Black

| 역할 | 값 | 비고 |
|------|-----|------|
| Background | #0A0A0A | 거의 검정 |
| Surface | #141414 | |
| Border | #262626 | |
| Text Primary | #F5F5F0 | 따뜻한 화이트 |
| Text Secondary | #A3A3A3 | |
| Text Disabled | #525252 | |

## Accent: Gold 또는 Silver (선택 — 0개 또는 1개)

```css
/* Gold */
--accent: #C9A96E;
--accent-hover: #B8964F;

/* Silver */
--accent: #9CA3AF;
--accent-hover: #8A919C;
```

Accent가 없어도 된다. 흑백만으로 충분하다.
Gold와 Silver를 동시에 쓰지 않는다.

## Accent 사용 규칙

```
쓸 수 있는 곳:
- 로고 옆 작은 점
- CTA 버튼 테두리 (배경 아님)
- 구분선 1개
- 선택된 상태 표시
- 가격 표시

쓰면 안 되는 곳:
- 배경 전체
- 텍스트 색
- 2곳 이상 동시 사용
- 큰 면적
```

Accent는 **귀금속**처럼 다룬다. 많이 쓰면 값이 떨어진다.

## 상태 색

```css
/* 색으로 상태를 표시하지 않는다 */
--success: var(--text-secondary); /* 텍스트 + 체크 아이콘 */
--error:   var(--text-primary);   /* 밑줄 + 텍스트 */
--warning: var(--text-secondary); /* 텍스트만 */
```

Luxury Minimal에서 빨강, 초록, 노랑은 존재하지 않는다.
상태는 텍스트의 어조와 아이콘으로만 전달한다.

## Claude에게

색을 추가하고 싶은 순간이 Luxury Minimal의 시험이다. 추가하지 마라.
Accent가 화면에 2번 이상 보이면 1개를 제거하라.
순수 검정(#000000) 대신 #0A0A0A, 순수 화이트(#FFFFFF)는 White 모드 배경에만.
