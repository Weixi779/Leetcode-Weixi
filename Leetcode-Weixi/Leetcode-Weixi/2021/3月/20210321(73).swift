//
//  20210321(73).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/3/21.
//

import Foundation

class Solution20210373 {
    func setZeroes(_ matrix: inout [[Int]]) {
        let rows = matrix[0].count
        let cols = matrix.count
        var rowsArray = [Int]()
        var colsArray = [Int]()
        for i in 0..<cols {
            for j in 0..<rows {
                if matrix[i][j] == 0 {
                    rowsArray.append(i)
                    colsArray.append(j)
                }
            }
        }
        
//        for index in 0..<rowsArray.count {
//            for 
//        }
    }
}
