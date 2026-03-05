# Component Voice — Organic Warm

## 원칙

컴포넌트가 친근하게 느껴져야 한다.
딱딱한 직각은 없다. 차가운 색은 없다. 과도한 피드백은 없다.
부드럽게 반응하고, 따뜻하게 보인다.

---

## Button

```css
/* Primary */
background: var(--accent);
color: #FFFFFF;
border: none;
border-radius: 24px; /* Soft 모드 */
/* border-radius: 40% 60% 60% 40% / 50%; */ /* Flowing 모드 */
padding: 12px 28px;
font-family: [부드러운 산세리프];
font-size: 15px;
font-weight: 500;
box-shadow: 0 4px 14px rgba([Accent RGB], 0.3);
transition: all 0.25s ease;

:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 20px rgba([Accent RGB], 0.4);
}

:active {
  transform: translateY(0);
  box-shadow: 0 2px 8px rgba([Accent RGB], 0.3);
}
```

Secondary:
```css
background: transparent;
border: 1.5px solid var(--border);
color: var(--text-primary);
border-radius: 24px;

:hover {
  background: var(--surface);
  border-color: var(--accent);
  color: var(--accent);
}
```

---

## Card

```css
background: var(--surface);
border: 1px solid var(--border);
border-radius: 16px; /* Soft */
/* border-radius: 24px 8px 24px 8px; */ /* Flowing */
padding: 28px;
box-shadow: 0 2px 12px rgba([Text Primary RGB], 0.06);
transition: all 0.3s ease;

:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 28px rgba([Text Primary RGB], 0.1);
}
```

이미지 카드:
```css
.card-image {
  border-radius: 12px; /* 카드 안에서 약간 작게 */
  overflow: hidden;
  margin-bottom: 20px;
}
```

---

## Form / Input

```css
input, textarea {
  background: var(--background);
  border: 1.5px solid var(--border);
  border-radius: 10px;
  padding: 12px 16px;
  font-family: [부드러운 산세리프];
  font-size: 15px;
  color: var(--text-primary);
  transition: all 0.2s ease;
}

input:focus {
  outline: none;
  border-color: var(--accent);
  box-shadow: 0 0 0 4px rgba([Accent RGB], 0.12);
  background: #FFFFFF; /* 포커스 시 약간 밝게 */
}

input::placeholder {
  color: var(--text-secondary);
  font-style: italic; /* Organic의 특징 */
}
```

Label:
```css
font-size: 14px;
font-weight: 500;
color: var(--text-secondary);
margin-bottom: 6px;
/* ALL CAPS 없음 — 자연스럽게 */
```

---

## Badge / Tag

```css
padding: 4px 12px;
border-radius: 20px;
font-size: 13px;
font-weight: 400;
background: var(--surface);
color: var(--text-secondary);
border: 1px solid var(--border);
```

Accent 태그:
```css
background: rgba([Accent RGB], 0.1);
color: var(--accent);
border-color: rgba([Accent RGB], 0.2);
```

---

## Navigation

```css
nav {
  background: rgba(var(--background-rgb), 0.85);
  backdrop-filter: blur(12px); /* Organic에서만 허용 */
  border-bottom: 1px solid var(--border);
  height: 64px;
  padding: 0 32px;
}

nav a {
  font-size: 15px;
  font-weight: 400;
  color: var(--text-secondary);
  text-decoration: none;
  transition: color 0.2s ease;
}

nav a:hover {
  color: var(--text-primary);
}

nav a.active {
  color: var(--accent);
  font-weight: 500;
}
```

*참고: backdrop-filter는 Organic Warm에서만 허용. 다른 Personality에서는 사용하지 않는다.*

---

## 상태 / 피드백

```css
/* Success toast */
background: rgba([Accent or Success RGB], 0.1);
border: 1px solid rgba([Accent or Success RGB], 0.2);
border-radius: 12px;
padding: 12px 16px;
/* 느린 fade-in: 0.4s ease */

/* Error */
border-color: rgba(196, 75, 43, 0.4); /* Warm red */
background: rgba(196, 75, 43, 0.06);
color: #C44B2B;
```

애니메이션 원칙:
```css
/* Organic의 모든 transition */
transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);

/* hover lift */
transform: translateY(-4px);

/* 클릭 */
transform: scale(0.97);
```
