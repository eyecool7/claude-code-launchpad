# Surface & Material — Editorial Authority

## 핵심 원칙

표면은 **존재감이 없어야 한다**.
카드, 배경, 컨테이너가 "저 여기 있어요"라고 외치면 안 된다.
구조는 느껴지되, 보이지 않아야 한다.

## 그림자 철학

Editorial은 **Soft shadow를 쓰지 않는다**.
Soft shadow는 모호함을 만든다. 이 디자인은 모호함을 거부한다.

허용되는 그림자:
```css
/* Flat — 그림자 없음, 테두리로 구분 */
border: 1px solid #E2E5EA;

/* Hard shadow — 명확한 오프셋, blur 없음 */
box-shadow: 3px 3px 0px #0F1117;  /* 강도: Mild */
box-shadow: 6px 6px 0px #0F1117;  /* 강도: Strong */
```

금지:
```css
box-shadow: 0 4px 20px rgba(0,0,0,0.1); ❌  /* Soft shadow */
box-shadow: 0 2px 8px rgba(0,0,0,0.15); ❌  /* Soft shadow */
```

## 텍스처: Expressive (하프톤) 모드

배경 또는 이미지 위에 하프톤 패턴을 적용한다.

하프톤 적용 규칙:
- 이미지에 적용할 때: 흑백 처리 후 하프톤 오버레이
  ```css
  filter: grayscale(100%) contrast(1.2);
  mix-blend-mode: multiply;
  ```
- 배경에 적용할 때: SVG 또는 CSS dot 패턴, opacity 0.06~0.12
- 하프톤 도트 크기: 2~4px (너무 크면 산만, 너무 작으면 안 보임)
- 이미지가 여러 장일 때: **모두 같은 처리** (일부만 하프톤 금지)

이미지 처리 원칙:
```
원칙: 색상 사진은 반드시 모노크롬 처리 후 사용
이유: 색 사진이 들어오는 순간 Accent 색의 역할이 흐려짐
예외: 브랜드가 허용한 경우에만 1장 컬러 가능
```

## 테두리 성격

```css
/* 기본 — 아주 연하게 */
border: 1px solid #E2E5EA;

/* 강조 테두리 — Accent 색으로 */
border-left: 3px solid [Accent];  /* 인용문, 강조 블록 */

/* 구분선 */
border-top: 1px solid #E2E5EA;
```

굵은 테두리(2px 이상)는 Hard shadow 요소에만.

## 모서리 (Border Radius)

```
기본 컴포넌트 (카드, 인풋): 2px
버튼: 2px
이미지: 0px (이미지는 항상 직각)
Badge/Tag: 2px
```

Editorial에서 둥근 모서리(8px+)는 Organic Warm의 영역이다. 쓰지 않는다.

## 배경 레이어 구성

```
Layer 1: 기본 배경 (#FFFFFF 또는 쿨 그레이)
Layer 2: 하프톤 텍스처 (opacity 0.08, position: fixed)
Layer 3: 컨텐츠
```
