//
//  2020:10:10.swift
//  sb
//
//  Created by 孙世伟 on 2020/10/10.
//  Copyright © 2020 me.Weixi. All rights reserved.
//

import Foundation

class Solution201010 {

    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func detectCycle(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        var slow: ListNode? = head
        var fast: ListNode? = head
        while (slow != nil && fast != nil) {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                fast = head
                while slow !== fast {
                    slow = slow?.next
                    fast = fast?.next
                }
                return fast
            }
            
        }
        return nil
    }

}
