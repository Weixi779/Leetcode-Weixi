//
//  20210330.swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/3/30.
//

import Foundation

class Solution0330 {
    func isPalindrome(_ x: Int) -> Bool {
        if x == 0 {
            return true
        }
        guard x > 0 ,  x % 10 != 0  else { return false }
        var left = x
        var right = 0
        while left > right {
            right = right * 10 + left % 10
            if left == right {
                return true
            }
            left = left / 10
            if left == right {
                return true
            }
        }
        return false
    }
}
