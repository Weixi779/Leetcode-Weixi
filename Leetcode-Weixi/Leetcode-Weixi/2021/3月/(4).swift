//
//  (4).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/3/26.
//

import Foundation


class Solution004 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var newnums = nums1 + nums2
        newnums = newnums.sorted { $0 < $1 }
        if newnums.count % 2 == 1 {
            let index = (newnums.count + 1) / 2
            return  Double(newnums[index - 1])
        } else {
            let index1 = (newnums.count - 2) / 2
            let index2 = (newnums.count) / 2
            return Double( (Double(newnums[index1]) + Double(newnums[index2])) / 2)
        }
    }
}
