//
//  240310.swift
//  Leetcode-Weixi
//
//  Created by 孙世伟 on 2024/3/10.
//

import Foundation

// - 题目: 299. 猜数字游戏
// - 地址: https://leetcode.cn/problems/bulls-and-cows

extension LeetCode2024.March {
    class Solution240310 {
        func getHint(_ secret: String, _ guess: String) -> String {
            let secret = Array(secret)
            let guess = Array(guess)
            var bulls = 0
            var secretArray = [Int](repeating: 0, count: 10)
            var guessArray = [Int](repeating: 0, count: 10)
            for (s, g) in zip(secret, guess) {
                if s == g {
                    bulls += 1
                } else {
                    secretArray[s.wholeNumberValue!] += 1
                    guessArray[g.wholeNumberValue!] += 1
                }
            }
            let cows = zip(secretArray, guessArray).reduce(0) { $0 + min($1.0, $1.1) }
            return "\(bulls)A\(cows)B"
        }
    }
}
