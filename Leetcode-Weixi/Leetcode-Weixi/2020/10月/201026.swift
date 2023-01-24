//
//  201026.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/10/26.
//

import Foundation
//8,1,2,2,3
class Solution201026 {
    func smallerNumbersThanCurrent(_ nums: [Int]) -> [Int] {
        let sorted = nums.sorted(){ $0 < $1 }
        var result = [Int]()
        for i in nums.indices {
            for j in sorted.indices {
                if sorted[j] == nums[i] {
                    result.append(j)
                    break
                }
            }
        }
        return result
    }
}

