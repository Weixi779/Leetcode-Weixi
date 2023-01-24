//
//  0317.swift
//  2022Leetcode
//
//  Created by yunzhanghu1186 on 2022/3/17.
//

import Foundation

class Solution0317 {
    func longestWord(_ words: [String]) -> String {
        let words = words.sorted()
        var map = [String]()
        var res = ""
        for word in words {
            if word.count == 1 || map.contains(word.dropLast().description) {
                map.append(word)
                if word.count > res.count { res = word }
            }
        }
        return res
    }
}
