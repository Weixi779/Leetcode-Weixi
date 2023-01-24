//
//  0303.swift
//  2022Leetcode
//
//  Created by yunzhanghu1186 on 2022/3/3.
//

import Foundation

class Solution0303 {
    func addDigits(_ num: Int) -> Int {
        var res = num
        while res.description.count != 1 {
            res = _helper(res)
        }
        return res
    }
    
    func _helper(_ num: Int) -> Int {
        var num = num
        var res = 0
        while num > 0 {
            res += num%10
            num /= 10
        }
        return res
    }
}
