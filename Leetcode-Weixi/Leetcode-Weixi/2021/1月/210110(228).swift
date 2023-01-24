//
//  210110(228).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/1/10.
//

import Foundation

class Solution210110 {
    func summaryRanges(_ nums: [Int]) -> [String] {
        var result = [String]()
        var temp = [Int]()
        for i in 0..<nums.count{
            if i+1<nums.count , nums[i]+1 == nums[i+1]{
                temp.append(nums[i])
            }else{
                temp.append(nums[i])
                result.append( temp.count > 1 ? ("\(temp.first!)->\(temp.last!)") : ("\(temp.first!)") )
                temp = [Int]()
            }
        }
        return result
    }
}
