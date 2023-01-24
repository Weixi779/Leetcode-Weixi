//
//  0125.swift
//  2022Leetcode
//
//  Created by yunzhanghu1186 on 2022/2/11.
//

import Foundation

class Solution0125 {
    func numberOfMatches(_ n: Int) -> Int {
        var num = n
        var res = 0
        while num != 1 {
            if num % 2 == 1 {
                res += (num - 1) / 2 + 1
                num = (num - 1) / 2
            } else {
                res += num / 2
                num = num / 2
            }
        }
        return res
    }
}
