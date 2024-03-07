//
//  240307.swift
//  Leetcode-Weixi
//
//  Created by 孙世伟 on 2024/3/7.
//

import Foundation

// - 题目: 2575. 找出字符串的可整除数组
// - 地址: https://leetcode.cn/problems/find-the-divisibility-array-of-a-string

extension LeetCode2024.March {
    class Solution240307 {
        func divisibilityArray(_ word: String, _ m: Int) -> [Int] {
            var result = [Int]()
            var sum = 0
            for char in word {
                let current: Int = char.wholeNumberValue ?? 0
                sum = (sum * 10 + current)
                let mod = sum % m
                if mod == 0 {
                    sum = 0
                    result.append(1)
                } else {
                    sum = mod
                    result.append(0)
                }
            }
            return result
        }
    }
}


