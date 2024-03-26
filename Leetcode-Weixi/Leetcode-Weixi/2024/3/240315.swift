//
//  240315.swift
//  Leetcode-Weixi
//
//  Created by 孙世伟 on 2024/3/16.
//

import Foundation

// - 题目: 2671. 频率跟踪器
// - 地址: https://leetcode.cn/problems/frequency-tracker

extension LeetCode2024.March {
    class FrequencyTracker {
        var numberMap = [Int: Int]()
        var countMap = [Int: Int]()

        init() {

        }
        
        func add(_ number: Int) {
            let numberValue = numberMap[number] ?? 0
            countMap[numberValue] = (countMap[numberValue] ?? 0) - 1
            numberMap[number] = numberValue + 1
            countMap[numberValue + 1] = (countMap[numberValue + 1] ?? 0) + 1
        }
        
        func deleteOne(_ number: Int) {
            guard let value = numberMap[number], value > 0 else { return }
            countMap[value] = (countMap[value] ?? 0) - 1
            numberMap[number] = value - 1
            countMap[value - 1] = (countMap[value - 1] ?? 0) + 1
        }
        
        func hasFrequency(_ frequency: Int) -> Bool {
            return (countMap[frequency] ?? 0) > 0
        }
    }
}
