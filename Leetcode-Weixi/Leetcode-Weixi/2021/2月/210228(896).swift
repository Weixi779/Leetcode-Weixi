//
//  210228(896).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/2/28.
//

import Foundation
// 简单的 垃圾方法
//class Solution210228 {
//    func isMonotonic(_ A: [Int]) -> Bool {
//        let a = A.sorted()
//        if a == A || a.reversed() == A {
//            return true
//        }
//        return false
//    }
//}
class Solution210228 {
    func isMonotonic(_ A: [Int]) -> Bool {
        guard A.count != 2 else {
            return true
        }
        var head = 0
        var tail = A.count-1
        let trend = A[head] < A[tail] ? 0 : 1

        while head < tail {
            if A[head] <= A[head+1] && A[tail-1] <= A[tail] && trend == 0{
                head += 1
                tail -= 1
            }else if A[head] >= A[head+1] && A[tail-1] >= A[tail] && trend == 1{
                head += 1
                tail -= 1
            }else{
                return false
            }
        }
        return true
    }
}

