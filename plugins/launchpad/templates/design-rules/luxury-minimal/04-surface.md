# Surface & Material — Luxury Minimal

## 핵심 원칙

표면은 **존재하지 않는 것처럼** 느껴져야 한다.
그림자 없음. 텍스처 없음. 오직 색과 극도로 가는 선만.
물질감이 없는 것이 Luxury Minimal의 물질감이다.

## 그림자 철학

Luxury Minimal은 **그림자를 사용하지 않는다**.

```css
/* 금지 — 모든 종류의 그림자 */
box-shadow: none;       /* 항상 */
filter: drop-shadow();  /* 항상 금지 */
text-shadow: none;      /* 항상 */
```

깊이는 그림자가 아니라 **여백과 색 차이**로 표현한다.
Surface(#FAFAFA)와 Background(#FFFFFF)의 미세한 차이가 레이어를 만든다.

## 텍스처 규칙

텍스처는 사용하지 않는다.

- 노이즈 없음
- 하프톤 없음
- 그리드 패턴 없음
- 종이 질감 없음

표면은 순수하고 매끈하다. 어떤 패턴도 고급스러움을 해친다.

## 테두리 성격

```css
/* 유일한 테두리 — 극도로 가늘게 */
border: 0.5px solid var(--border);

/* 구분선 */
border-top: 0.5px solid var(--border);

/* Accent 테두리 (Gold/Silver) */
border: 0.5px solid var(--accent);
```

**0.5px만 허용한다.** 1px도 두꺼워 보인다.
테두리가 "보인다"면 너무 두꺼운 것이다. "느껴져야" 한다.

## 모서리 (Border Radius)

```
모든 컴포넌트: 0px
버튼: 0px
카드: 0px (카드라는 개념 자체를 최소화)
인풋: 0px
이미지: 0px
Badge: 0px
```

**border-radius 전면 금지.** 0px. 예외 없음.
Luxury Minimal에서 둥근 모서리는 캐주얼함을 의미한다.

## 배경 레이어 구성

```
Layer 1: 단색 배경 (#FFFFFF 또는 #0A0A0A)
Layer 2: 없음
Layer 3: 컨텐츠
```

배경은 순수한 단색이다. 레이어가 적을수록 고급스럽다.

## 이미지 처리

```css
/* 이미지는 전체 너비로, 여백 없이 */
.image-full {
  width: 100%;
  height: auto;
  display: block;
}

/* 이미지 위 오버레이 없음 */
/* 이미지 위 텍스트 없음 */
/* 이미지는 독립적으로 존재한다 */
```

이미지와 텍스트 사이에는 충분한 여백(40px 이상)을 둔다.

## Claude에게

shadow를 쓰고 싶은 순간이 오면 여백으로 해결하라.
border가 0.5px를 넘으면 이 파일을 다시 읽어라.
"아무것도 없는데 괜찮은가?" — Luxury Minimal에서 그것이 완성이다.
