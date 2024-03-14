//
//  240314.swift
//  Leetcode-Weixi
//
//  Created by 孙世伟 on 2024/3/14.
//

import Foundation

// - 题目: 2789. 合并后数组中的最大元素
// - 地址: https://leetcode.cn/problems/largest-element-in-an-array-after-merge-operations

extension LeetCode2024.March {
    class Solution240314 {
        func maxArrayValue(_ nums: [Int]) -> Int {
            return nums.reversed().reduce(0) { a, b in
                return a >= b ? a + b : b
            }
        }
    }
}
