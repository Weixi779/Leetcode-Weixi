//
//  0307.swift
//  2022Leetcode
//
//  Created by yunzhanghu1186 on 2022/3/7.
//

import Foundation

class Solution0307 {
    func convertToBase7(_ num: Int) -> String {
        guard num != 0 else { return "0"}
        guard num > 0 else { return "-\(convertToBase7(-num))"}
        var num = num
        var res = ""
        while num > 0 {
            res = "\(num%7)" + res
            num /= 7
        }
        return res
    }
}
