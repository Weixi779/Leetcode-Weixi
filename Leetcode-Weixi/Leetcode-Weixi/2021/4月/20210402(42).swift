//
//  20210402(42).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/4/2.
//

import Foundation


class Solution0402 {
    //解法一暴力
    func trapI(_ height: [Int]) -> Int {
        var result = 0
        for index in 1..<height.count-1 {
            var max_left = 0
            var max_right = 0
            for leftLoop in (0...index).reversed() {
                max_left = max(max_left, height[leftLoop])
            }
            for rightLoop in (index..<height.count) {
                max_right = max(max_right, height[rightLoop])
            }
            result += min(max_left, max_right) - height[index]
        }
        return result
    }
    
    func trapII(_ height: [Int]) -> Int {
        var result = 0
        var left_array = [Int](repeating: 0, count: height.count)
        var right_array = [Int](repeating: 0, count: height.count)
        
        for left in 1..<height.count {
            left_array[left] = max(left_array[left-1], height[left-1])
        }
        
        for right in (0..<height.count-1).reversed() {
            right_array[right] = max(right_array[right+1], height[right+1])
        }
        
        for index in 1..<height.count-1 {
            let tempmin = min(left_array[index], right_array[index])
            if tempmin > height[index] {
                result += tempmin - height[index]
            }
        }
        return result
    }
}
