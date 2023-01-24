//
//  0717.swift
//  2022Leetcode
//
//  Created by yunzhanghu1186 on 2022/7/17.
//

import Foundation

// - 题目: 565. 数据嵌套
// - 地址: https://leetcode.cn/problems/array-nesting/


class Solution0717 {
    func arrayNesting(_ nums: [Int]) -> Int {
        var visits = [Bool](repeating: false, count: nums.count)
        var res = -1
        for index in 0..<nums.count {
            var currentIndex = index
            var temp = 0
            while visits[currentIndex] == false {
                visits[currentIndex] = true
                currentIndex = nums[currentIndex]
                temp += 1
            }
            res = max(res, temp)
        }
        return res
    }
}
