//
//  20210313(705).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/3/13.
//

import Foundation


class MyHashSet {
    var hashMap = [Bool](repeating:false,count:1000001)
    /** Initialize your data structure here. */
    init() {
        
    }

    func add(_ key: Int) {
        hashMap[key] = true
    }

    func remove(_ key: Int) {
        hashMap[key] = false
    }

    /** Returns true if this set contains the specified element */
    func contains(_ key: Int) -> Bool {
        return hashMap[key]
    }

}
//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init() { self.val = 0; self.next = nil; }
//    public init(_ val: Int) { self.val = val; self.next = nil; }
//    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
//}
class Solution20210313_002 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        var last = ListNode(-1)
        let head = last
        var temp = 0
        while l1 != nil || l2 != nil{
            temp += (l1?.val ?? 0) + (l2?.val ?? 0)
            l1 = l1?.next
            l2 = l2?.next
            let node = ListNode(temp%10)
            last.next = node
            last = last.next!
            temp /= 10
        }
        
        if temp > 10{
            last.next = ListNode(temp%10)
        }
        return head.next
    }

}

class Solution20210313_003 {
    //解法:滑动窗口
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s == "" {
            return 0
        }
        var maxstr = String()
        var curstr = String()
        for char in s{
            while curstr.contains(char) {
                curstr.remove(at: curstr.startIndex)
            }
            curstr.append(char)
            if curstr.count > maxstr.count {
                maxstr = curstr
            }
        }
        return maxstr.count
    }
}
