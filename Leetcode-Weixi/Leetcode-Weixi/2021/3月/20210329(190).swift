//
//  20210329.swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/3/29.
//

import Foundation

class Solution20210329 {
    func reverseBits(_ n: Int) -> Int {
        var num = n
        var result = 0
        for _ in 1...32{
            result = result * 2 + (num&1)
            num = num >> 1
        }
        return result
    }
    
}
