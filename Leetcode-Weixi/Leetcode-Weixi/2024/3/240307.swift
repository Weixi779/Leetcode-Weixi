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
            let chars = Array(word)
            var result = [Int](repeating: 0, count: word.count)
            var sum = 0
            for index in chars.indices {
                let current = chars[index].wholeNumberValue ?? 0
                sum = ((sum * 10) + current) % m
                if sum == 0 { result[index] = 1 }
            }
            return result
        }
    }
}


