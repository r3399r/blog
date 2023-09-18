---
title: "Add Two Numbers"
date: 2023-09-18T10:32:31+08:00
draft: false
tags: ["Linked List","Math","Recursion","Medium"]
categories: ["Leetcode"]
---
<!--more-->
## Description
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.

## Example

{{< admonition type=success title="Example 1" open=true >}}
**Input:** `l1 = [2,4,3], l2 = [5,6,4]`

**Output:** `[7,0,8]`

**Explanation:** 342 + 465 = 807.
{{< /admonition >}}

{{< admonition type=success title="Example 2" open=true >}}
**Input:** `l1 = [0], l2 = [0]`

**Output:** `[0]`
{{< /admonition >}}

{{< admonition type=success title="Example 3" open=true >}}
**Input:** `l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]`

**Output:** `[8,9,9,9,0,0,0,1]`
{{< /admonition >}}

{{< admonition type=tip title="Contraint" open=true >}}
- The number of nodes in each linked list is in the range `[1, 100]`.
- `0 <= Node.val <= 9`
- It is guaranteed that the list represents a number that does not have leading zeros.
{{< /admonition >}}

## Solution

```javascript
const addTwoNumbers = (l1, l2) =>{
  const head = new ListNode(0);
    let carry=0
    let current=head
    while(l1||l2||carry>0){
        let sum = carry;
        sum = sum + (l1?l1.val:0);
        sum = sum + (l2?l2.val:0);
        current.next=new ListNode(sum>=10?sum-10:sum);
        current=current.next;
        carry=sum>=10?1:0
        if(l1)l1=l1.next;
        if(l2)l2=l2.next
    }
    return head.next
};
```

Source: https://leetcode.com/problems/two-sum/
