//
//  201102.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/11/2.
//

import Foundation

class Solution201102 {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result = [Int]()
        let a = ([Int](Set(nums1)) + [Int](Set(nums2))).sorted()
        if a.count < 2 { return [] }
        for index in 0..<(a.count-1) {
            if a[index] == a[index+1] {
                result.append(a[index])
            }
        }
        return result
    }
    //解法2
    func intersectionv2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        return Array(Set(nums1).intersection(Set(nums2)))
    }

}
