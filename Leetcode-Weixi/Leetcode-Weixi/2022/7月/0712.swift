//
//  0712.swift
//  2022Leetcode
//
//  Created by yunzhanghu1186 on 2022/7/12.
//

import Foundation


class Solution0712 {
    func oddCells(_ m: Int, _ n: Int, _ indices: [[Int]]) -> Int {
        var matrix = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        var result = 0
        for coordinate in indices {
            for x in 0..<m {
                matrix[x][coordinate[1]] += 1
            }
            for y in 0..<n {
                matrix[coordinate[0]][y] += 1
            }
        }
        for array in matrix {
            for value in array {
                if value % 2 == 1 { result += 1 }
            }
        }
        return result
    }
}
