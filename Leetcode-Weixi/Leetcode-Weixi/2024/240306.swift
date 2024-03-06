//
//  240306.swift
//  Leetcode-Weixi
//
//  Created by 孙世伟 on 2024/3/6.
//

import Foundation

// - 题目: 2917. 找出数组中的 K-or 值
// - 地址: https://leetcode.cn/problems/find-the-k-or-of-an-array

extension LeetCode2024.March {
    class Solution240306 {
        func findKOr(_ nums: [Int], _ k: Int) -> Int {
            var result = 0;
            for i in 0..<31 {
                var count = 0
                for num in nums {
                    if ((num >> i) & 1) == 1 {
                       count += 1
                    }
                }
                if count >= k {
                    result |= 1 << i
                }
            }
            return result
        }
    }
}
