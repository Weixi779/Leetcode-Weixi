//
//  20210318(59).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/3/18.
//

import Foundation


class Solution20210318 {
//    func generateMatrix(_ n: Int) -> [[Int]] {
//        var result = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
//        var rows = n + 1
//        var cols = n
//        var x = 0
//        var y = -1
//        var content = 1
//        var count = 0
//        while rows > 0 && cols > 0 {
//            rows -= 1
//            for _ in 0..<rows{
//                count % 2 == 0 ? (y += 1) : (y -= 1)
//                result[x][y] = content
//                content += 1
//            }
//            cols -= 1
//            for _ in 0..<cols{
//                count % 2 == 0 ? (x += 1) : (x -= 1)
//                result[x][y] = content
//                content += 1
//            }
//            count += 1
//        }
//        return result
//    }
//    class Solution {
//        func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
//            var leftpart = head
//            while leftpart?.next?.val != left {
//                leftpart = leftpart?.next
//            }
//            var pre = leftpart?.next
//            var curr = pre?.next
//            var rightpart = leftpart
//            while rightpart?.val != right {
//                rightpart = rightpart?.next
//            }
//            rightpart = rightpart?.next
//            pre?.next = rightpart
//            while curr?.val != rightpart?.val {
//                var temp = curr
//                curr = curr?.next
//                temp?.next = pre
//                pre = temp
//            }
//            leftpart?.next = pre
//            return head
//        }
//    }
}

//public class ListNode {
//    public var val: Int
//    public var next: ListNode?
//    public init() { self.val = 0; self.next = nil; }
//    public init(_ val: Int) { self.val = val; self.next = nil; }
//    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
//}
