//
//  200907.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/11/4.
//

import Foundation

class Solution200910 {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var allResult: [[Int]] = [[Int]]()
        var results:[Int] = [Int]()
        var result: [Int] = [Int]()
        let countNumber = Set(nums)
        for _ in 0..<countNumber.count{
            allResult.append([Int]())
        }
        
        for i in nums{
            var bottom: Int = 0
            for j in countNumber {
                if i == j{
                    allResult[bottom].append(i)
                }
                bottom += 1
            }
        }
        
        for i in allResult {
            results.append(i.count)
        }
        
        print(allResult)
        print(results)
        for _ in 0..<k{
            var index: Int = 0
            var Max = 0
            for i in 0..<results.count{
                if results[i] > Max{
                    Max = results[i]
                    index = i
                }
            }
            result.append(allResult[index][0])
            allResult.remove(at: index)
            results.remove(at: index)
        }
        print(allResult)
        print(results)
        return result
    }
}
