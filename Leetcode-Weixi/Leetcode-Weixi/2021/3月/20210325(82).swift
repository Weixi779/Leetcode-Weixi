//
//  20210325(82).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/3/25.
//

import Foundation

class Solution20210325 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var newHead: ListNode?
        var newCur: ListNode?
        
        var pre: ListNode?
        var now: ListNode? = head
        var next: ListNode? = head?.next
        
        while now != nil {
            if pre?.val != now?.val , now?.val != next?.val {
                if newHead == nil {
                    newHead = now
                    newCur = now
                } else {
                    newCur?.next = now
                    newCur = now
                }
            }
            pre = now
            now = next
            next = now?.next
        }
        newCur?.next = now
        return newHead
    }
}
