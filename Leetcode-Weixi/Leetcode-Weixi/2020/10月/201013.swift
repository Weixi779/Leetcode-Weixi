//
//  201013.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/10/13.
//

import Foundation

class Solution201013{
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    
    func swapPairs(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil { return head }
             let next = head!.next
             head?.next = swapPairs(next!.next)
             next!.next = head
             return next
    }
}
