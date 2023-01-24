//
//  20210327(61).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/3/27.
//

import Foundation

class Solution20210327 {
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        var head = head
        var tail = head
        var count = 0
        while tail?.next != nil {
            count += 1
            tail = tail?.next
        }
        tail?.next = head
        for _ in 1...k {
            head = head?.next
            tail = tail?.next
        }
        tail?.next = nil
        return head
    }
    
    func longestPalindrome(_ s: String) -> String {
        var maxStr = ""
        var curStr = ""
        for char in s {
            while curStr != String(curStr.reversed()) {
                curStr.remove(at: curStr.startIndex)
            }
            curStr.append(char)
            if curStr == String(curStr.reversed()) {
                if maxStr.count < curStr.count {
                    maxStr = curStr
                }
            }
        }
        return maxStr
    }
}
