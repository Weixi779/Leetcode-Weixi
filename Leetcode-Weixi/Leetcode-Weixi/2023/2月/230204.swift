//
//  230204.swift
//  Leetcode-Weixi
//
//  Created by 孙世伟 on 2023/2/4.
//

import Foundation

// - 题目: 1798. 你能构造出连续值的最大数目
// - 地址: https://leetcode.cn/problems/maximum-number-of-consecutive-values-you-can-make/description/

extension LeetCode2023.February {
    class Solution230204 {
        func getMaximumConsecutive(_ coins: [Int]) -> Int {
            return coins.sorted().reduce(1) { $1 > $0 ? $0 : $0 + $1 }
            // MARK: - 三元
//            return coins.sorted().reduce(1) { dp, coin in
//                coin > dp ? dp : dp + coin
//            }
            // MARK: - reduce
//            return coins.sorted().reduce(1) { lastResult, coin in
//                if coin > lastResult { return lastResult }
//                return lastResult + coin
//            }
            // MARK: - 最初版本
//            let coins = coins.sorted()
//            var result = 1
//            for coin in coins {
//                if coin > result {
//                    break
//                }
//                result += coin
//            }
//            return result
        }
    }
}
