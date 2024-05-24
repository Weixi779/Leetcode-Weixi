//
//  240524.swift
//  Leetcode-Weixi
//
//  Created by 孙世伟 on 2024/5/24.
//

import Foundation

// - 题目: 1673. 找出最具竞争力的子序列π
// - 地址: https://leetcode.cn/problems/find-the-most-competitive-subsequence

extension LeetCode2024.May {
    class Solution240524 {
        // 思路: 贪心 + 单调栈
        func mostCompetitive(_ nums: [Int], _ k: Int) -> [Int] {
            var stack = [Int]()
            for (index, value) in nums.enumerated() {
                while let last = stack.last, nums.count - index + stack.count > k, last > value {
                    let _ = stack.popLast()
                }
                stack.append(value)
            }
            
            return Array(stack.prefix(k))
        }
    }
}
