//
//  20210324(456).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/3/24.
//

import Foundation
//[1,0,1,-4,-3]
class Solution20210324 {
    func find132pattern(_ nums: [Int]) -> Bool {
        var ak = Int.min
        var stack:[Int] = []

        for num in nums.reversed() {
            if ak > num {
                return true
            }
            while let last = stack.last, last < num {
                ak = stack.removeLast()
            }
            stack.append(num)
        }
        return false
    }
}
func AloneStack(_ nums:[Int]) -> [Int] {
    var stack = [Int]()
    for num in nums.reversed(){
        while let last = stack.last, last < num {
            stack.removeLast()
        }
        stack.append(num)
    }
    return stack
}
