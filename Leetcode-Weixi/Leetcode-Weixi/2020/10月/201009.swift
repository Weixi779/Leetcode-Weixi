//
//  2020:10:9.swift
//  sb
//
//  Created by 孙世伟 on 2020/10/9.
//  Copyright © 2020 me.Weixi. All rights reserved.
//

import Foundation

//class Solution {
//    func hasCycle(_ head: ListNode?) -> Bool {
//        var slow = head
//        var fast = head?.next
//
//        while slow != nil && fast != nil {
//            if slow === fast { return true }
//            slow = slow?.next
//            fast = fast?.next?.next
//        }
//
//        return false
//    }



 

class Solution201009 {
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head?.next
        
        while slow != nil && fast != nil {
            if slow === fast {
                return true
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return false
    }
}
