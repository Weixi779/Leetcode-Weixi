//
//  0301.swift
//  2022Leetcode
//
//  Created by yunzhanghu1186 on 2022/3/1.
//

import Foundation

class Solution0301 {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else { return s }
        var matrix = [[Character]](repeating: [Character](), count: numRows)
        var row = 0
        var isDown = false
        for s in s {
            if row == 0 { isDown = true }
            if row == numRows-1 { isDown = false }
            matrix[row].append(s)
            if isDown == true {
                row += 1
            } else {
                row -= 1
            }
        }
        return matrix.compactMap{$0}.reduce("", {$0+$1})
    }
}
