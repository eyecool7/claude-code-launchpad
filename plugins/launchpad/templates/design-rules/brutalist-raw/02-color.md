# Color — Brutalist Raw

## 핵심 원칙

색은 2개면 충분하다. Black + White.
필요하면 원색 1개를 추가한다. 그 이상은 없다.
파스텔, 그라디언트, 중간 톤은 존재하지 않는다.

## 팔레트 구조

```
Background  → Black 또는 White (중간 없음)
Text        → Background의 반대
Accent      → 원색 1개 (선택)
Border      → Text와 동일
```

## 기본 팔레트: White 모드

| 역할 | 값 |
|------|-----|
| Background | #FFFFFF |
| Text Primary | #000000 |
| Border | #000000 |

## 대안 팔레트: Black 모드

| 역할 | 값 |
|------|-----|
| Background | #000000 |
| Text Primary | #FFFFFF |
| Border | #FFFFFF |

## Accent 색 (선택 — 0개 또는 1개)

```css
/* 옵션 A: Red */
--accent: #FF0000;

/* 옵션 B: Yellow */
--accent: #FFFF00;

/* 옵션 C: Blue */
--accent: #0000FF;

/* 옵션 D: 없음 — Black + White만 */
```

Accent는 **순수 원색**만 허용한다.
`#E63B2E` 같은 세련된 빨강은 Brutalist가 아니다. `#FF0000`이다.

## Accent 사용 규칙

```
쓸 수 있는 곳:
- CTA 버튼 배경
- 핵심 헤드라인 색
- 에러 상태 테두리
- 호버 시 배경 반전

쓰면 안 되는 곳:
- 그라디언트의 일부
- 투명도를 적용한 상태 (rgba 금지)
- 배경 전체 (섹션 1개까지만)
- 3곳 이상 동시 사용
```

## 상태 색

```css
--error:   #FF0000;
--success: #000000; /* 텍스트로 전달 */
--warning: #FFFF00; /* 또는 텍스트로만 */
```

상태를 부드러운 색으로 감싸지 않는다.
에러는 빨갛고, 나머지는 텍스트가 직접 말한다.

## Claude에게

색을 추가하고 싶은 충동이 들면 추가하지 마라.
Black, White, 그리고 최대 1개의 원색. 이것이 전부다.
