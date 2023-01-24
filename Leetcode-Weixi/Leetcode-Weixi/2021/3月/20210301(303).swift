//
//  20210301(303).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/3/1.
//

import Foundation

class NumArray {

    var nums = [Int]()
    var dp = [Int]()
    init(_ nums: [Int]) {
        var count = 0
        for i in nums{
            self.nums.append(i)
            count += i
            dp.append(count)
        }
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
        return dp[j] - dp[i] + nums[i]
    }
}
