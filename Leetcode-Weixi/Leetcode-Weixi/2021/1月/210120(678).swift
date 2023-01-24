//
//  210120(678).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/1/20.
//

import Foundation
class Solution210120 {
    func maximumProduct(_ nums: [Int]) -> Int {
        
        var min1 = Int.max
        var min2 = Int.max
        
        var max1 = Int.min
        var max2 = Int.min
        var max3 = Int.min
        
        for num in nums{
            if num < min2 {
                min2 = num
                if min2 < min1 {
                    min2 = min1
                    min1 = num
                }
            }
            
            if num > max3{
                if num >= max1{
                    max3 = max2
                    max2 = max1
                    max1 = num
                }else if num >= max2{
                    max3 = max2
                    max2 = num
                }else{
                    max3 = num
                }
            }
        }
        return max(min1 * min2 * max1, max1 * max2 * max3)
    }
//    func maximumProduct(_ nums: [Int]) -> Int {
//        let nums = nums.sorted(by: >)
//        return max(nums[0]*nums[1]*nums[2], nums[0]*nums[nums.count-1]*nums[nums.count-2])
//    }
}
