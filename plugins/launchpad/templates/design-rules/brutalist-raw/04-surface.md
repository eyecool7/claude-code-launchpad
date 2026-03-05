# Surface & Material — Brutalist Raw

## 핵심 원칙

표면은 거칠어야 한다. 부드러운 표면은 없다.
그림자는 딱딱하게, 테두리는 굵게, 모서리는 직각으로.

## 그림자 철학

Brutalist는 **Hard shadow만** 사용한다. blur는 0.

```css
/* 기본 Hard shadow */
box-shadow: 4px 4px 0px #000000;

/* 강한 Hard shadow */
box-shadow: 8px 8px 0px #000000;

/* 역전 모드 (어두운 배경) */
box-shadow: 4px 4px 0px #FFFFFF;

/* Accent shadow */
box-shadow: 6px 6px 0px var(--accent);
```

금지:
```css
box-shadow: 0 4px 12px rgba(0,0,0,0.1);  /* Soft shadow 금지 */
box-shadow: 0 2px 8px rgba(0,0,0,0.15);  /* Soft shadow 금지 */
filter: drop-shadow(0 4px 8px rgba(0,0,0,0.1)); /* 금지 */
```

## 텍스처 규칙

Brutalist는 텍스처를 쓰지 않는다.
노이즈 없음. 하프톤 없음. 패턴 없음.
순수한 단색 표면만 존재한다.

예외: 의도적인 "깨진" 효과 (글리치, 스캔라인)는 허용.
```css
/* 스캔라인 효과 (선택적) */
background-image: repeating-linear-gradient(
  0deg,
  transparent,
  transparent 2px,
  rgba(0, 0, 0, 0.03) 2px,
  rgba(0, 0, 0, 0.03) 4px
);
```

## 테두리 성격

테두리는 **굵고 명확**하다.

```css
/* 기본 테두리 — 최소 2px */
border: 2px solid #000000;

/* 강조 테두리 */
border: 3px solid #000000;

/* 구분선 */
border-top: 3px solid #000000;

/* 역전 모드 */
border: 2px solid #FFFFFF;
```

1px 테두리는 사용하지 않는다. 너무 섬세하다.

## 모서리 (Border Radius)

```
모든 컴포넌트: 0px
버튼: 0px
카드: 0px
인풋: 0px
이미지: 0px
Badge: 0px
```

**border-radius는 전면 금지다.** 0px. 예외 없음.

## 배경 레이어 구성

```
Layer 1: 단색 배경 (#FFFFFF 또는 #000000)
Layer 2: 없음 (텍스처 없음)
Layer 3: 컨텐츠
```

배경은 순수한 단색이다. 복잡한 레이어링은 Brutalist가 아니다.

## Claude에게

"이게 너무 거칠지 않나?"라는 생각이 들면 그것이 올바른 상태다.
border-radius를 추가하고 싶은 충동을 참아라. 0px이다.
soft shadow를 쓰려는 순간 이 파일을 다시 읽어라.
