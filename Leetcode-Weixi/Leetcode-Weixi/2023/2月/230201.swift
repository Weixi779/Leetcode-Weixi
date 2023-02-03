//
//  230201.swift
//  Leetcode-Weixi
//
//  Created by yunzhanghu1186 on 2023/2/2.
//

import Foundation

// - 题目: 2325. 解密消息
// - 地址: https://leetcode.cn/problems/decode-the-message/

extension LeetCode2023.February {
    class Solution230201 {
        func decodeMessage(_ key: String, _ message: String) -> String {
            var result = ""
            var hashMap: [Character:Character] = [" ":" "]
            let asciiValueForA = 97
            // 构建hashmap
            for char in key {
                hashMap[char] = (hashMap[char] ?? Character(UnicodeScalar(asciiValueForA + hashMap.count - 1)!))
            }
            // 转换message
            for char in message {
                result.append(hashMap[char]!)
            }
            
            return result
        }
    }
}
