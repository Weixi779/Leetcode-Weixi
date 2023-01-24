//
//  210105.swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/1/5.
//

import Foundation

class Solution210105 {
    func largeGroupPositions(_ s: String) -> [[Int]] {
        var result = [[Int]]()
        let array = [Character](s)
        var startIndex = 0
        var endIndex = 0
        while startIndex < array.count {
            while endIndex < s.count , array[startIndex] == array[endIndex] {
                endIndex += 1
            }
            if endIndex - startIndex >= 3 {
                result.append([startIndex,endIndex-1])
            }
            startIndex = endIndex
        }
        return result
    }
}
