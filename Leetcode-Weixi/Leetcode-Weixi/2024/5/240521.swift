//
//  0521.swift
//  Leetcode-Weixi
//
//  Created by 孙世伟 on 2024/5/21.
//

import Foundation

// - 题目: 2769. 找出最大的可达成数字
// - 地址: https://leetcode.cn/problems/find-the-maximum-achievable-number

extension LeetCode2024.May {
    class Solution240521 {
        func theMaximumAchievableX(_ num: Int, _ t: Int) -> Int {
            return num + t * 2
        }
    }
}
