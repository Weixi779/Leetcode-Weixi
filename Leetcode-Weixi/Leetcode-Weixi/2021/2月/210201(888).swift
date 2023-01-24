//
//  210201.swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/2/1.
//

import Foundation

class Solution210201 {
    func fairCandySwap(_ A: [Int], _ B: [Int]) -> [Int] {
        var totalA = 0
        var totalB = 0
        A.forEach{ totalA += $0}
        B.forEach{ totalB += $0}
        let count = (totalA - totalB)/2
        let setB = Set(B)
        for a in A{
            if setB.contains(a - count){
                return [a,a - count]
            }
        }
        return []
    }
}
