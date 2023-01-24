//
//  0305.swift
//  2022Leetcode
//
//  Created by yunzhanghu1186 on 2022/3/5.
//

import Foundation

class Solution0305 {
    func findLUSlength(_ a: String, _ b: String) -> Int {
        return a == b ? -1 : max(a.count, b.count)
    }
}
