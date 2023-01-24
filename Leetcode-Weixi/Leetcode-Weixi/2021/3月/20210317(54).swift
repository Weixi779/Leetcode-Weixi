//
//  20210317(54).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/3/17.
//

import Foundation
class Solution210317 {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var result = [Int]()
        var x = 0
        var y = -1
        var rows = matrix[0].count + 1
        var cols = matrix.count
        var count = 0
        while result.count < matrix.count * matrix[0].count {
            rows -= 1
            for _ in 0..<rows{
                count % 2 == 0 ? (y += 1) : (y -= 1)
                result.append(matrix[x][y])
            }
            cols -= 1
            for _ in 0..<cols{
                count % 2 == 0 ? (x += 1) : (x -= 1)
                result.append(matrix[x][y])
            }
            count += 1
        }
        return result
    }
}
