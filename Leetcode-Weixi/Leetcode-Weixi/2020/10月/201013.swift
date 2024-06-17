//
//  201013.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/10/13.
//

import Foundation

class Solution201013{
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
             let next = head!.next
             head?.next = swapPairs(next!.next)
             next!.next = head
             return next
    }
}
