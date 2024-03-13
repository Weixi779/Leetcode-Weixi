//
//  240313.swift
//  Leetcode-Weixi
//
//  Created by 孙世伟 on 2024/3/13.
//

import Foundation

// - 题目: 2864. 最大二进制奇数
// - 地址: https://leetcode.cn/problems/maximum-odd-binary-number

extension LeetCode2024.March {
    class Solution240313 {
        func maximumOddBinaryNumber(_ s: String) -> String {
            var ones = s.filter { $0 == "1" }
            let zerosCount = s.count - ones.count
            ones.removeLast()
            return ones + String(repeating: "0", count: zerosCount) + "1"
        }
    }
}
