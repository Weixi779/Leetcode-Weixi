//
//  210108(189).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/1/8.
//

import Foundation

class Solution210108 {
    func rotate(_ nums: inout [Int], _ k: Int) {
        let rotateCount = k % nums.count
        nums.reverse()
        nums[0..<rotateCount].reverse()
        nums[rotateCount..<nums.count].reverse()
    }
}
//有点垃圾
//func rotate(_ nums: inout [Int], _ k: Int) {
//    for _ in 0..<k{
//        nums.insert(nums.removeLast(), at: 0)
//        print(nums)
//    }
//}
