//
//  240311.swift
//  Leetcode-Weixi
//
//  Created by 孙世伟 on 2024/3/11.
//

import Foundation

// - 题目: 2129. 将标题首字母大写
// - 地址: https://leetcode.cn/problems/capitalize-the-title

extension LeetCode2024.March {
    class Solution240311 {
        func capitalizeTitle(_ title: String) -> String {
            return title.split(separator: " ").map { word in
                word.count > 2 ? word.lowercased().capitalized : word.lowercased()
            }.joined(separator: " ")
        }
//        return title.split(separator: " ").map { word in
//            zip(word, 0..<word.count).map { (char, index) in
//                word.count > 2 && index == 0 ? char.uppercased() : char.lowercased()
//            }.joined()
//        }.joined(separator: " ")
    }
}
