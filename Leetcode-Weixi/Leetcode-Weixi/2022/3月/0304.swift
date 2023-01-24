//
//  0304.swift
//  2022Leetcode
//
//  Created by yunzhanghu1186 on 2022/3/4.
//

import Foundation

class Solution0304 {
    func subArrayRanges(_ nums: [Int]) -> Int {
        var res = 0
        for i in nums.indices {
            var minVal = Int.max
            var maxVal = Int.min
            for j in i..<nums.count {
                minVal = min(minVal, nums[j])
                maxVal = max(maxVal, nums[j])
                res += maxVal-minVal
            }
        }
        return res
    }
}
