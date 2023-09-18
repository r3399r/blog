---
title: "Two Sum"
date: 2023-09-18T09:58:12+08:00
draft: false
tags: ["Array","Hash Table","Easy"]
categories: ["Leetcode"]
---
<!--more-->
## Description
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.

## Example

{{< admonition type=success title="Example 1" open=true >}}
**Input:** `nums = [2,7,11,15], target = 9`

**Output:** `[0,1]`

**Explanation:** Because `nums[0] + nums[1] == 9`, we return `[0, 1]`.
{{< /admonition >}}

{{< admonition type=success title="Example 2" open=true >}}
**Input:** `nums = [3,2,4], target = 6`

**Output:** `[1,2]`
{{< /admonition >}}

{{< admonition type=success title="Example 3" open=true >}}
**Input:** `nums = [3,3], target = 6`

**Output:** `[0,1]`
{{< /admonition >}}

{{< admonition type=tip title="Contraint" open=true >}}
- `2 <= nums.length <= 104`
- `-109 <= nums[i] <= 109`
- `-109 <= target <= 109`
- Only one valid answer exists.
{{< /admonition >}}

## Solution

```javascript
const twoSum = (nums, target) => {
  const map = {};
  for (let i = 0; i < nums.length; i++) {
    const another = target - nums[i];

    if (another in map) return [map[another], i];

    map[nums[i]] = i;
  }

  return null;
};
```

Source: https://leetcode.com/problems/two-sum/
