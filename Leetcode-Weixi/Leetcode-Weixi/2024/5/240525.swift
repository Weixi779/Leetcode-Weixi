//
//  240525.swift
//  Leetcode-Weixi
//
//  Created by 孙世伟 on 2024/5/25.
//

import Foundation

// - 题目: 2903. 找出满足差值条件的下标 I
// - 地址: https://leetcode.cn/problems/find-indices-with-index-and-value-difference-i

extension LeetCode2024.May {
    class Solution240525 {
        func findIndices(_ nums: [Int], _ indexDifference: Int, _ valueDifference: Int) -> [Int] {
            guard nums.count > indexDifference else { return [-1, -1] }

            let count = nums.count - indexDifference
            for i in 0..<count {
                let startIndex = i + indexDifference
                for j in startIndex..<nums.count {
                    if abs(nums[i] - nums[j]) >= valueDifference {
                        return [i, j]
                    }
                }
            }
            return [-1, -1]
        }
    }
}
