# Space & Rhythm — Tech Precision
# [오버라이드 적용: Dense 모드]

## 핵심 원칙

그리드는 신성하다. 1px도 벗어나지 않는다.
여백은 정보의 일부다. 데이터 간 관계를 공간으로 표현한다.

## Base Unit

**4px** 기준.

```
4px   — 마이크로: 아이콘-텍스트 간격
8px   — 관련 요소 내부
12px  — 인풋 패딩
16px  — 카드 내부 기본 패딩
24px  — 컴포넌트 간 간격
32px  — 섹션 내 블록 간격
32px  — 섹션 패딩 (Dense 모드 최대값)
```

## 밀도 설정: Dense 모드

- 섹션 패딩: 32px 상하
- 카드 패딩: 16px
- 정보 간 여백: 8~12px
- 대시보드처럼 모든 정보가 한 화면에
- 그리드선으로 구역 구분 (테두리 대신)

## 그리드

12컬럼 그리드, gutter 16px. 모든 요소는 그리드 안. 예외 없음.

```css
display: grid;
grid-template-columns: repeat(12, 1fr);
gap: 16px;
max-width: 1280px;
```

## 수직 그리드선 (Dense 모드 활성)

배경에 미세한 그리드선 표시:
```css
background-image: 
  linear-gradient(rgba(55, 65, 81, 0.3) 1px, transparent 1px),
  linear-gradient(90deg, rgba(55, 65, 81, 0.3) 1px, transparent 1px);
background-size: 24px 24px;
```

## 최대 너비

```
전체 레이아웃: max-width 1280px
본문 텍스트: 제한 없음 (Dense 모드)
```

## 정렬 원칙

- 모든 것이 그리드에 snap
- 수직 중앙 정렬 허용 (데이터 레이블에)
- 숫자는 오른쪽 정렬 (표에서 특히)
- 텍스트는 항상 왼쪽 정렬
