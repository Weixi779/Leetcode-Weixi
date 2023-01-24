//
//  201103.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/11/3.
//

import Foundation

class Solution201103 {
    func validMountainArray(_ A: [Int]) -> Bool {
        var head = 0
        var tail = A.count-1
        while head < tail && A[head] < A[head+1] {
            head += 1
        }
        while head < tail && A[tail] < A[tail-1]  {
            tail -= 1
        }
        if tail == A.count-1 || head == 0 {return false}
        return head == tail
    }
    
}
