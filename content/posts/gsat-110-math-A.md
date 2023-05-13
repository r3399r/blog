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
