//
//  210117.swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/1/18.
//

import Foundation

class Solution {
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        for i in 1..<coordinates.count-1{
            let y1 = coordinates[i][1] - coordinates[i-1][1]
            let x1 = coordinates[i][0] - coordinates[i-1][0]
            let y2 = coordinates[i+1][1] - coordinates[i][1]
            let x2 = coordinates[i+1][0] - coordinates[i][0]
            if y1*x2 != y2*x1 {
                return false
            }
        }
        return true
    }
}
