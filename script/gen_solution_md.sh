for id in "$@"
do
cat <<EOF >./content/posts/solution/"$id".md
---
title: "$1"
date: $(date -Iseconds)
draft: false
categories: ["數學"]
---
<!--more-->

## 問題
<img src="/posts/solution/$id-q.png">

## 詳解
<img src="/posts/solution/$id-sol.png">

EOF
done