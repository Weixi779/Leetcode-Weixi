//
//  210114.swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/1/14.
//

import Foundation
class Solution210114 {
    func prefixesDivBy5(_ A: [Int]) -> [Bool] {
        guard A.count > 0 else {
            return []
        }

        var res = [Bool]()

        var prev = 0

        for i in 0..<A.count {
            prev = (prev << 1 + A[i]) % 5
            res.append(prev == 0)
        }

        return res
//        var temp = 0
//        var result = [Bool]()
//        for i in A{
//            temp = temp * 2 + i
//            if temp % 5 == 0 {
//                result.append(true)
//            }else{
//                result.append(false)
//            }
//            temp = temp % 10
//        }
//        return result
    }
}
