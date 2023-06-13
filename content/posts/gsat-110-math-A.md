---
title: "111 年學測數學 A 試題及詳解"
date: 2023-05-09T14:20:55+08:00
draft: true
tags: ["學測","數學"]
categories: ["數學"]
description: "111 年學測作為 108 課綱的第一次學測，有其指標意義，此篇文章為讀者們帶來 111 年學測數學 A 試題及詳解"
math: true
---
<!--more-->
# 111學年度學科能力測驗試題-數學A考科

## 單選題

### 1. 冰淇淋店

某冰淇淋店最少需準備 $n$ 桶不同口味的冰淇淋，才能滿足廣告所稱「任選兩球不同口味冰淇淋的組合數超過 100 種」。試問來店顧客從 $n$ 桶中任選兩球（可為同一口味）共有幾種方法？

<div style="display:flex;gap:20px;flex-wrap:wrap">
<div>(1) 101</div><div>(2) 105</div><div>(3) 115</div><div>(4) 120</div><div>(5) 225</div>
</div>

#### Sol.

$C^n_2>100$

$\Rightarrow\dfrac{n(n-1)}2>100$

$\Rightarrow n^2-n-200>0$

$\Rightarrow n>\dfrac{1+\sqrt{801}}2\ge15$，因為 $28<\sqrt{801}<29$

當 $n=15$ 時，可提供 $C^{15}_2+15=\dfrac{15\times14}2+15=120$ 種方法，故選 **(4)**。

---

### 2. 計算機按 log

某品牌計算機在計算對數 $\log_ab$ 時需按 $\boxed\log$ $\boxed($ $\boxed a$ $\boxed,$ $\boxed b$ $\boxed)$。某生在計算 $\log_ab$ 時（其中 $a>1$ 且 $b>1$）順序弄錯，誤按 $\boxed\log$ $\boxed($ $\boxed b$ $\boxed,$ $\boxed a$ $\boxed)$，所得為正確值的 $\dfrac94$ 倍。試選出 $a,b$ 間的關係式。

<div style="display:flex;gap:20px;flex-wrap:wrap">
<div>(1) $a^2=b^3$</div><div>(2) $a^3=b^2$</div><div>(3) $a^4=b^9$</div><div>(4) $2a=3b$</div><div>(5) $3a=2b$</div>
</div>

#### Sol.

依題意列示，

$\dfrac94\log_ab=\log_ba=\dfrac{\log_aa}{\log_ab}$

$\Rightarrow(\log_ab)^2=\dfrac49$

$\Rightarrow\log_ab=\dfrac23$

$\Rightarrow a^{\frac23}=b$

$\Rightarrow a^2=b^3$，故選 **(1)**。

---

### 3. 投影與變異數

在處理二維數據時，有種方法是將數據垂直投影到某一直線，並以該直線為數線，進而了解投影點所成一維數據的變異。下圖的一組二維數據，試問投影到哪一選項的直線，所得之一維投影數據的變異數會是最小？
<div style="display:flex;justify-content:space-between;flex-wrap:wrap">
<div>
(1) $y=2x$

(2) $y=-2x$

(3) $y=-x$

(4) $y=\dfrac x2$

(5) $y=-\dfrac x2$
</div>
<div style="min-width:250px;max-width:40%;">
<img src="/images/gsat-110-3.png">
</div>
</div>

#### Sol.


---

### 4. 等差與對數

設等差數列 $\langle a_n\rangle$ 之首項 $a_1$ 與公差 $d$ 皆為正數，且 $\log a_1$，$\log a_3$，$\log a_6$ 依序也成等差數列。試選出數列 $\log a_1$，$\log a_3$，$\log a_6$ 的公差。

<div style="display:flex;gap:20px;align-items:center;flex-wrap:wrap">
<div>(1) $\log d$</div><div>(2) $\log\dfrac23$</div><div>(3) $\log\dfrac32$</div><div>(4) $\log2d$</div><div>(5) $\log3d$</div>
</div>

#### Sol.


---

### 5. 傳染病

已知某地區有 30％ 的人口感染某傳染病。針對該傳染病的快篩試劑檢驗，有陽性或陰性兩結果。已知該試劑將染病者判為陽性的機率為 80％，將未染病者判為陰性的機率則為 60％。為降低該試劑將染病者誤判為陰性的情況，專家建議連續採檢三次。若單次採檢判為陰性者中，染病者的機率為 $P$；而連續採檢三次皆判為陰性者中，染病者的機率為 $P\'$。試問 $\dfrac P{P\'}$ 最接近哪一選項？

<div style="display:flex;gap:20px;align-items:center;flex-wrap:wrap">
<div>(1) 7</div><div>(2) 8</div><div>(3) 9</div><div>(4) 10</div><div>(5) 11</div>
</div>

#### Sol.

