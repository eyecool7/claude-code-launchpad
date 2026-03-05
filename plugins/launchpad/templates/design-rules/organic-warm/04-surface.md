# Surface & Material — Organic Warm

## 핵심 원칙

표면은 **만질 수 있는 것처럼** 느껴져야 한다.
종이의 질감, 나무의 따뜻함, 천의 부드러움.
차갑고 매끈한 디지털 표면이 아니라 아날로그 물성을 갖는다.

## 그림자 철학

Organic Warm은 **따뜻하고 부드러운 그림자**만 사용한다.

```css
/* 기본 — 미세한 lift */
box-shadow: 0 2px 12px rgba(26, 18, 8, 0.06);

/* 중간 — 카드 hover */
box-shadow: 0 8px 28px rgba(26, 18, 8, 0.1);

/* 강한 — 모달, 드롭다운 */
box-shadow: 0 12px 40px rgba(26, 18, 8, 0.14);
```

그림자 색은 **따뜻한 톤**(#1A1208 기반)이다.
순수 검정(`rgba(0,0,0,...)`)으로 그림자를 만들지 않는다.

금지:
```css
box-shadow: 4px 4px 0px #000;  /* Hard shadow 금지 */
box-shadow: 0 0 20px rgba(0,255,65,0.4); /* Glow 금지 */
```

## 텍스처: Paper Texture

배경에 미세한 종이 노이즈를 적용한다.

```css
/* CSS noise — 종이 질감 */
background-image: url("data:image/svg+xml,..."); /* SVG noise */
/* 또는 */
filter: url(#paper-noise); /* SVG filter */

/* 적용 규칙 */
opacity: 0.04~0.08; /* 은은하게 */
mix-blend-mode: multiply;
pointer-events: none;
position: fixed;
```

노이즈 적용 규칙:
- 전체 배경에 한 번만 적용 (개별 카드에 각각 적용하지 않음)
- opacity 0.08 이하 (눈에 띄면 안 된다 — 느껴져야 한다)
- 이미지 위에는 적용하지 않음

## 테두리 성격

```css
/* 기본 — 부드럽고 연한 */
border: 1px solid var(--border); /* #DDD5C8 */

/* 강조 — Accent와 함께 */
border: 1.5px solid var(--accent);

/* 구분선 */
border-top: 1px solid var(--border);
```

테두리는 구조를 암시하되, 존재감을 주장하지 않는다.
2px 이상의 굵은 테두리는 사용하지 않는다.

## 모서리 (Border Radius)

```
카드: 16px (Soft 모드)
버튼: 24px (pill 형태) 또는 10px
인풋: 10px
이미지 (카드 내): 12px
Badge / Tag: 20px (pill)
모달: 16px
```

Organic Warm의 서명은 **넉넉한 둥근 모서리**다.
8px 미만은 딱딱해 보인다.

### Flowing 모드 (대안)

```css
/* 유기적 비대칭 곡선 */
border-radius: 24px 8px 24px 8px;
/* 또는 */
border-radius: 40% 60% 60% 40% / 50%;
```

Flowing 모드는 더 유기적이지만 모든 곳에 쓰면 산만하다.
CTA 버튼이나 히어로 영역에만 선택적으로 사용한다.

## 배경 레이어 구성

```
Layer 1: 따뜻한 배경 (#FAF7F0)
Layer 2: 종이 텍스처 노이즈 (opacity 0.05, position: fixed)
Layer 3: 컨텐츠
```

## Claude에게

그림자를 만들 때 rgba(0,0,0,...) 대신 따뜻한 톤의 rgba를 사용하라.
border-radius가 4px 이하면 Organic Warm이 아니다. 최소 8px.
표면이 차갑게 느껴지면 배경 색을 확인하라 — 순수 화이트(#FFFFFF)가 아닌 크림(#FAF7F0)이어야 한다.
