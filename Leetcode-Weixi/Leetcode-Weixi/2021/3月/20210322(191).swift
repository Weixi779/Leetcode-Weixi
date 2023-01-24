//
//  20210322.swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/3/22.
//

import Foundation

class Solution20210322 {
//    func hammingWeight(_ n: Int) -> Int {
//        var result = 0
//        for char in n.description {
//            if char == "1" {
//                result += 1
//            }
//        }
//        return result
//    }
    func hammingWeight2(_ n: Int) -> Int {
        var num = n
        var count = 0

        while num != 0 {
            count += (num & 1)
            num = num>>1
        }
        return count
    }
}
