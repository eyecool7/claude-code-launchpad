# Component Voice — Luxury Minimal

## 원칙

컴포넌트가 존재를 주장하지 않는다.
버튼도, 카드도, 폼도 — 내용이 주인공이고 컴포넌트는 그릇이다.
최소한의 것만 남긴다.

---

## Button

```css
/* Primary — 채운 배경 없음 */
background: transparent;
color: var(--text-primary);
border: 0.5px solid var(--text-primary);
border-radius: 0;
padding: 14px 40px;
font-family: [얇은 세리프];
font-size: 12px;
font-weight: 300;
letter-spacing: 0.2em;
text-transform: uppercase;
transition: all 0.5s ease; /* 느리게 */

:hover {
  background: var(--text-primary);
  color: var(--background);
}
```

Accent(Gold/Silver) 버튼:
```css
border-color: var(--accent);
color: var(--accent);

:hover {
  background: var(--accent);
  color: var(--background);
}
```

**Luxury Minimal에는 Filled 버튼이 없다.**
모든 버튼은 Ghost(outline) 기반이다.

---

## Card

```css
/* 기본 — 테두리도 그림자도 없음 */
background: var(--surface);
padding: 40px;
border-radius: 0;

/* 구분이 필요한 경우만 */
border-top: 0.5px solid var(--border);
```

카드보다는 **구역(section)으로 생각한다**.
카드 컴포넌트를 최소화하고 여백으로 구분한다.

이미지 + 텍스트 레이아웃:
```css
display: grid;
grid-template-columns: 1fr 1fr;
gap: 80px; /* 넉넉하게 */
align-items: start;
```

---

## Form / Input

```css
input {
  background: transparent;
  border: none;
  border-bottom: 0.5px solid var(--border);
  border-radius: 0;
  padding: 12px 0;
  font-family: [얇은 세리프 또는 산세리프];
  font-size: 14px;
  font-weight: 300;
  color: var(--text-primary);
  width: 100%;
  transition: border-color 0.4s ease;
}

input:focus {
  outline: none;
  border-bottom-color: var(--text-primary);
  /* 또는 Accent 색 */
}

input::placeholder {
  color: var(--text-disabled);
  font-weight: 300;
}
```

Label:
```css
font-size: 10px;
font-weight: 300;
letter-spacing: 0.2em;
text-transform: uppercase;
color: var(--text-secondary);
display: block;
margin-bottom: 12px;
```

Bottom-border only input이 Luxury Minimal의 서명이다.
박스형 인풋은 사용하지 않는다.

---

## Navigation

```css
nav {
  background: var(--background);
  border-bottom: 0.5px solid var(--border);
  height: 72px;
  padding: 0 80px;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

/* 로고 */
.logo {
  font-family: [얇은 세리프];
  font-weight: 300;
  font-size: 16px;
  letter-spacing: 0.15em;
  text-transform: uppercase;
}

/* 메뉴 */
nav a {
  font-size: 11px;
  font-weight: 300;
  letter-spacing: 0.15em;
  text-transform: uppercase;
  color: var(--text-secondary);
  text-decoration: none;
  transition: color 0.4s ease;
}

nav a:hover, nav a.active {
  color: var(--text-primary);
}
```

---

## Badge / Tag

```css
/* 없는 게 낫다. 불가피한 경우: */
padding: 3px 10px;
border: 0.5px solid var(--border);
border-radius: 0;
font-size: 10px;
font-weight: 300;
letter-spacing: 0.12em;
text-transform: uppercase;
color: var(--text-secondary);
background: transparent;
```

---

## 상태 / 피드백

```css
/* 색으로 상태를 표시하지 않는다 — 텍스트로만 */

/* 성공 */
.status-success {
  font-size: 12px;
  letter-spacing: 0.1em;
  text-transform: uppercase;
  color: var(--text-secondary);
}
.status-success::before { content: '✓  '; }

/* 에러 */
.status-error {
  font-size: 12px;
  letter-spacing: 0.1em;
  color: var(--text-primary);
  border-bottom: 0.5px solid var(--text-primary);
  padding-bottom: 2px;
}

/* Loading */
/* 스피너 없음 — 텍스트 opacity 0.4로만 */
.loading { opacity: 0.4; }
```

애니메이션 원칙:
```css
/* 모든 transition: 느리고 우아하게 */
transition: all 0.5s cubic-bezier(0.25, 0, 0, 1);

/* hover 이동: 없음 (translateY 없음) */
/* scale: 없음 */
/* 오직 색상과 opacity 변화만 */
```
