//
//  200909.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/11/4.
//

import Foundation

class Solution200909 {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result: [[Int]] = [[Int]]()
        var array: [Int] = [Int]()
        var sum: Int = 0
        combinatonSumDFS(0,&array, &sum, target, candidates, &result)
        return result
        
        
    }
    func combinatonSumDFS(_ start: Int , _ array: inout [Int] ,_ sum: inout Int,_ target: Int,_ candidates:  [Int],_ result: inout [[Int]]){
        
        if sum > target{
            return
        }
        
        if sum == target{
            print(result)
            result.append(array)
        }
        
        for index in start..<candidates.count {
            sum = sum + candidates[index]
            array.append(candidates[index])
            print(array)
            print(sum)
            combinatonSumDFS(index,&array, &sum, target, candidates, &result)
            sum = sum - candidates[index]
            array.removeLast()
        }
    }
}
