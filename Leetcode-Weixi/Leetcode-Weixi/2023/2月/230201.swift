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
            var hashMap: [String:String] = [" ":" "]
            let letters = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
            // 构建hashmap
            for char in key {
                let str = String(char)
                // 无值时 才会去赋值
                hashMap[str] = (hashMap[str] ?? letters[hashMap.count-1])
            }
            // 转换message
            for char in message {
                let str = String(char)
                result.append(hashMap[str]!)
            }
            
            return result
        }
    }
}
