//
//  210116.swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/1/16.
//

import Foundation

class Solution210115{
    func removeStones(_ stones: [[Int]]) -> Int {
        var parentX = [Int]()
        var parentY = [Int]()
        var result = 0
        
        for stone in stones{
            if parentX.contains(stone[0]) || parentY.contains(stone[1]){
                parentX.append(stone[0])
                parentY.append(stone[1])
                result += 1
            }else{
                parentX.append(stone[0])
                parentY.append(stone[1])
            }
        }
        return result
    }
}
