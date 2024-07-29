//
//  240729.swift
//  Leetcode-Weixi
//
//  Created by 孙世伟 on 2024/7/29.
//

import Foundation

// - 题目: 682. 棒球比赛
// - 地址: https://leetcode.cn/problems/baseball-game/
extension LeetCode2024.July {
    func calPoints(_ operations: [String]) -> Int {
        var stack = [Int]()
        let chars = operations
        for char in chars {
            if let number = Int(char) {
                stack.append(number)
            } else if char == "C" {
                stack.removeLast()
            } else if char == "D" {
                if let last = stack.last {
                    stack.append(last * 2)
                }
            } else if char == "+" {
                let last = stack[stack.count - 1]
                let preLast = stack[stack.count - 2]
                stack.append(last + preLast)
            }
        }
        return stack.reduce(0, +)
    }
}
