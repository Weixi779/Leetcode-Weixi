//
//  20210302(304).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/3/2.
//

import Foundation

class NumMatrix {
    
    var matrix = [[Int]]()
    var rows = [[Int]]()
    
    init(_ matrix: [[Int]]) {
        self.matrix = matrix
        
        for i in 0..<matrix.count{
            var tempRows = [Int]()
            var rowsSum = 0
            
            for j in 0..<matrix[i].count{
                rowsSum += matrix[i][j]
                tempRows.append(rowsSum)
            }
            rows.append(tempRows)
        }
    }

    func sumRegion(_ row1: Int, _ col1: Int, _ row2: Int, _ col2: Int) -> Int {
        var result = 0
        for row in row1...row2{
            result += rows[row][col2] - rows[row][col1] + matrix[row][col1]
        }
        return result
    }

}
