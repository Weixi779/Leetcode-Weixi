//
//  20210326(83).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/3/26.
//

import Foundation

class Solution20210326 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var node = head

        while node != nil {
            if node?.val == node?.next?.val {
                node?.next = node?.next?.next
            } else {
                node = node?.next
            }
        }
        return head
    }
}
