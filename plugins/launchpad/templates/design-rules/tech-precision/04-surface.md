# Surface & Material — Tech Precision

## 핵심 원칙

표면은 데이터의 그릇이다. 존재감을 최소화하고 내용에 집중시킨다.
그림자 대신 glow, 텍스처 대신 그리드선으로 깊이를 표현한다.

## 그림자 철학

Tech Precision은 **전통적 그림자를 쓰지 않는다**.
깊이는 glow(발광)로 표현한다.

```css
/* Accent glow — 활성 상태, CTA */
box-shadow: 0 0 12px rgba(var(--accent-rgb), 0.25);

/* 강한 glow — hover */
box-shadow: 0 0 20px rgba(var(--accent-rgb), 0.4);

/* 미세한 glow — focus ring */
box-shadow: 0 0 0 3px rgba(var(--accent-rgb), 0.15);
```

금지:
```css
box-shadow: 0 4px 12px rgba(0,0,0,0.1);  /* 전통적 shadow 금지 */
box-shadow: 4px 4px 0px #000;             /* Hard shadow 금지 */
```

## 텍스처: Grid Dot Pattern (선택)

배경에 미세한 그리드 도트 패턴을 적용할 수 있다.

```css
/* 그리드 도트 — 정밀함의 시각적 표현 */
background-image: radial-gradient(
  circle,
  rgba(var(--border-rgb), 0.4) 1px,
  transparent 1px
);
background-size: 24px 24px;

/* 그리드 라인 — 대시보드 배경 */
background-image:
  linear-gradient(rgba(var(--border-rgb), 0.3) 1px, transparent 1px),
  linear-gradient(90deg, rgba(var(--border-rgb), 0.3) 1px, transparent 1px);
background-size: 24px 24px;
```

노이즈, 하프톤, 종이 텍스처는 사용하지 않는다.

## 테두리 성격

```css
/* 기본 — 얇고 정밀 */
border: 1px solid var(--border);

/* 활성 상태 */
border: 1px solid var(--accent);

/* 구분선 */
border-top: 1px solid var(--border);
```

테두리는 항상 1px. 2px 이상은 사용하지 않는다.
테두리는 정보의 경계를 표시하는 것이지 장식이 아니다.

## 모서리 (Border Radius)

```
카드, 패널: 4px
버튼: 4px
인풋: 4px
Badge / Tag: 3px
Progress bar: 0px
이미지: 0px 또는 4px
```

최대 4px. 그 이상은 부드러워 보인다. Tech Precision은 부드럽지 않다.

## 배경 레이어 구성

```
Layer 1: 기본 배경 (var(--background), 보통 #0A0E17)
Layer 2: 그리드 도트 또는 라인 패턴 (opacity 0.3 이하)
Layer 3: Surface 레이어 (카드, 패널)
Layer 4: 컨텐츠
```

## Claude에게

shadow를 쓰고 싶을 때 glow로 대체할 수 있는지 먼저 생각하라.
border가 1px를 넘으면 이 파일을 다시 확인하라.
배경 패턴은 콘텐츠를 방해하면 안 된다 — opacity를 낮게 유지하라.
