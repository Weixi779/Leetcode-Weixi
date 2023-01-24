//
//  201107.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/11/7.
//

import Foundation

class Solution201107 {
    func reverse(_ x: Int) -> Int {
        let I_MAX = Int(pow(2.0, 31.0)-1)
        let I_MIN = Int(-pow(2.0, 31.0))
        var result: Int = 0
        var temp = x
        while temp != 0 {
            result = result*10 + temp%10
            temp /= 10
        }
        if result > I_MAX || result < I_MIN {
            return 0
        }
        return result
    }
}
