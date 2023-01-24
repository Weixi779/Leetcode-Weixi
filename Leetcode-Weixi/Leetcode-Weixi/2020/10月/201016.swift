//
//  201016.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/10/24.
//

import Foundation

class Solution201016 {
    func sortedSquares(_ A: [Int]) -> [Int] {
        var result = [Int]()
        for index in A.indices {
            let temp = A[index] * A[index]
            result.append(temp)
        }
        result = result.sorted(){ $0 < $1 }
        return result
    }
}
