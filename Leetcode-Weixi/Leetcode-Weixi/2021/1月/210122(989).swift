//
//  210122(989).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/1/22.
//

import Foundation

class Solution210122 {
    func addToArrayForm(_ A: [Int], _ K: Int) -> [Int] {
        var result: [Int] = []
        var i = A.count - 1
        var curr = K
        
        while i >= 0 || curr > 0 {
            if i >= 0 {
                curr += A[i]
                i -= 1
            }
            result.append(curr % 10)
            curr /= 10
        }
        return result.reversed()
        
        
    }
}
