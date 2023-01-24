//
//  200911.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/11/4.
//

import Foundation
class Solution200911 {
    var result:[[Int]] = [[Int]]()
    
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var tempArray: [Int] = [Int]()
        var sum: Int = 0
        var sortedArray: [Int] = [Int]()
        if k > n {
            return result
        }
        for i in 1...9{
            sortedArray.append(i)
        }
        print(sortedArray)
        combinationSum3DFS(0, sortedArray, &tempArray, k, n, &sum)
    
        return result
    }
    
    func combinationSum3DFS(_ start: Int , _ sortedArray: [Int] , _ tempArray: inout [Int] ,  _ k: Int , _ n: Int , _ sum: inout Int){
        if tempArray.count > k || sum > n {
            return
        }
        if sum == n && tempArray.count == k {
            result.append(tempArray)
            return
        }
        for index in start..<sortedArray.count {
            tempArray.append(sortedArray[index])
            sum += sortedArray[index]
            print(tempArray)
            combinationSum3DFS(index+1, sortedArray, &tempArray, k, n, &sum)
            sum -= sortedArray[index]
            tempArray.removeLast()
        }
    }
}
