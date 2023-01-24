//
//  0223.swift
//  2022Leetcode
//
//  Created by yunzhanghu1186 on 2022/2/23.
//

import Foundation

class Solution0223 {
    func reverseOnlyLetters(_ s: String) -> String {
        var res = [Character](s)
        var left = 0
        var right = s.count - 1
        while left < right {
            while left < right , helper(res[left]) != true {
                left += 1
            }
            while right > left, helper(res[right]) != true {
                right -= 1
            }
            res.swapAt(left, right)
            left += 1
            right -= 1
        }
        return res.reduce("" , {$0 + String($1)})
    }

    func helper(_ input: Character) -> Bool {
        if (input >= "a" && input <= "z") || (input >= "A" && input <= "Z") {
            return true
        }
        return false
    }
}
