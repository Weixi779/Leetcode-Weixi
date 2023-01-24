//
//  201030.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/10/30.
//

import Foundation

class Solution201030 {
    var nextX = [0,-1,0,1]
    var nextY = [-1,0,1,0]
    var result: Int = 0
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        for i in grid.indices {
            for j in grid[i].indices {
                if grid[i][j] == 1 {
                    var temp = 4
                    for z in 0..<4 {
                        if ( (i + nextX[z] >= 0) && ( i + nextX[z] < (grid.count) ) ) && ( (j + nextY[z] >= 0) && ( j + nextY[z] < (grid[0].count) )) && grid[i+nextX[z]][j+nextY[z]] == 1{
                                temp -= 1
                        }
                    }
                    result += temp
                }
            }
        }
        return result
    }
}
