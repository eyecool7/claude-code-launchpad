# Color — Organic Warm

## 핵심 원칙

색은 자연에서 온다. 화면에서도 따뜻함이 느껴져야 한다.
차가운 회색, 순수한 검정, 네온은 존재하지 않는다.

## 팔레트 구조

```
Background  → 따뜻한 밝은 톤
Surface     → Background보다 살짝 진한 따뜻한 톤
Border      → 부드러운 구분선
Text        → 따뜻한 다크 톤 (순수 검정 아님)
Accent      → 자연에서 온 포인트 색
```

## 팔레트 옵션 A: Cream & Ink

| 역할 | 값 | 비고 |
|------|-----|------|
| Background | #FAF7F0 | 크림 화이트 |
| Surface | #F2EDE3 | 따뜻한 베이지 |
| Surface+ (hover) | #EAE3D6 | |
| Border | #DDD5C8 | |
| Text Primary | #1A1208 | 잉크 블랙 (따뜻한) |
| Text Secondary | #6B5E4E | 따뜻한 회색 |
| Text Disabled | #A89A88 | |

## 팔레트 옵션 B: Earth

| 역할 | 값 | 비고 |
|------|-----|------|
| Background | #FAF7F0 | |
| Surface | #F5EDE0 | |
| Border | #E0D5C5 | |
| Text Primary | #2C1810 | 다크 브라운 |
| Text Secondary | #7A6555 | |
| Accent Primary | #C44B2B | 테라코타 |
| Accent Secondary | #5A7247 | 올리브 그린 |
| Accent Tertiary | #D4A574 | 샌드 베이지 |

## 팔레트 옵션 C: Sage

| 역할 | 값 | 비고 |
|------|-----|------|
| Background | #F8FAF7 | 아주 연한 그린 |
| Surface | #EFF3EC | |
| Border | #D5DDD0 | |
| Text Primary | #1A2418 | 다크 그린 |
| Text Secondary | #5A6B55 | |
| Accent | #7A9B6A | 세이지 그린 |
| Accent Warm | #C48B5C | 따뜻한 보조색 |

## Accent 사용 규칙

```
쓸 수 있는 곳:
- Primary CTA 버튼 배경
- Active 상태 표시
- 링크 색
- 아이콘 포인트
- 카드 hover 시 테두리

쓰면 안 되는 곳:
- 텍스트 전체 색
- 배경 전체 (작은 영역만)
- 3곳 이상 동시 사용
```

## 상태 색

```css
--success: #5A7247; /* 따뜻한 그린 */
--warning: #D4A040; /* 따뜻한 앰버 */
--error:   #C44B2B; /* 따뜻한 레드 */
--info:    var(--accent);
```

상태 색도 차갑지 않아야 한다.
`#EF4444` 같은 차가운 빨강 대신 `#C44B2B` 같은 따뜻한 빨강을 사용한다.

## Claude에게

`#000000`(순수 검정)은 사용하지 마라. 항상 따뜻한 다크 톤을 써라.
차가운 회색(`#6B7280`)이 보이면 따뜻한 회색(`#6B5E4E`)으로 교체하라.
