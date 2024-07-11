//
//  Hot100.swift
//  Leetcode-Weixi
//
//  Created by 孙世伟 on 2024/6/17.
//

import Foundation

class HotProblem {}

// - MARK: 1. 两数之和
extension HotProblem {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        // value : index
        var numberMap = [Int: Int]()
        for (index, value) in nums.enumerated() {
            if let differenceIndex = numberMap[target - value] {
                return [index, differenceIndex]
            } else {
                numberMap[value] = index
            }
        }
        return []
    }
}

// - MARK: 2. 两数相加
extension HotProblem {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let head = ListNode()
        var node = head
        var l1 = l1, l2 = l2
        var carry = false
        while (l1 != nil || l2 != nil) {
            var nextValue = (l1?.val ?? 0) + (l2?.val ?? 0) + (carry == true ? 1 : 0)
            carry = nextValue >= 10
            nextValue = nextValue % 10
            node.next = ListNode(nextValue)
            node = node.next!
            l1 = l1?.next
            l2 = l2?.next
        }
        if carry == true {
            node.next = ListNode(1)
        }
        return head.next
    }
}


// MARK: - 树 专项

// MARK: 102. 二叉树的层序遍历
extension HotProblem {
//    // - 递归写法
//    func levelOrder(_ root: TreeNode?) -> [[Int]] {
//        var result = [[Int]]()
//        var height = 0
//        helper(root, height, &result)
//        return result
//    }
//    
//    func helper(_ node: TreeNode?, _ height: Int, _ grid: inout [[Int]]) {
//        guard let node = node else { return }
//        if grid.count <= height { grid.append([]) }
//        grid[height].append(node.val)
//        helper(node.left, height + 1,  &grid)
//        helper(node.right, height + 1 , &grid)
//    }
    // - 遍历写法
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [[Int]]() }
        var result = [[Int]]()
        var nodes: [TreeNode] = [root]
        var children: [TreeNode] = []
        while !nodes.isEmpty {
            var value = [Int]()
            for node in nodes {
                value.append(node.val)
                if let left = node.left { children.append(left) }
                if let right = node.right { children.append(right) }
            }
            result.append(value)
            nodes = children
            children = [TreeNode]()
        }
        return result
    }
    
    public class Node {
        public var val: Int
        public var children: [Node]
        public init(_ val: Int) {
            self.val = val
            self.children = []
        }
    }
//    // - 递归写法
//    func preorder(_ root: Node?) -> [Int] {
//        guard let root = root else { return [] }
//        var result = [Int]()
//        helper(root, &result)
//        return result
//    }
//    
//    func helper(_ node: Node?, _ array: inout [Int]) {
//        guard let node = node else { return }
//        array.append(node.val)
//        for child in node.children {
//            helper(child, &array)
//        }
//    }
//    // - 遍历写法
    func preorder(_ root: Node?) -> [Int] {
        guard let root = root else { return [] }
        var result = [Int]()
        var queue: [Node] = [root]
        while !queue.isEmpty {
            let first = queue.removeFirst()
            queue = first.children + queue
            result.append(first.val)
        }
        return result
    }
}

// MARK: 3. 无重复字符的最长子串
/*
 算法: 滑动窗口
 关键字: 连续子数组 最长 / 最短
 思想模版:
    双指针while循环
    while (右指针没到终点) {
        更新结果
        while (记过符合当前要求) {
            判断是否记录结果
            窗口缩小
        }
        窗口扩大
        (或者使用if 窗口缩小 else 窗口扩大 灵活判断)
    }
 */

extension HotProblem {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let chars = [Character](s)
        var charSet = Set<Character>()
        var left = 0
        var right = 0
        var result = 0

        while right < chars.count {
            // 尝试扩展窗口右边界
            if !charSet.contains(chars[right]) {
                charSet.insert(chars[right])
                right += 1
                result = max(result, right - left)  // 更新最大长度
            } else {
                // 如果遇到重复字符，则移动左边界
                charSet.remove(chars[left])
                left += 1
            }
        }
        
        return result
    }
}

// - MARK: 4. 寻找两个正序数组的中位数

extension HotProblem {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let count = nums1.count + nums2.count
        let midCount = count / 2
        let nums3 = (nums1 + nums2).sorted()
        
        if count % 2 == 1 {
            return Double(nums3[midCount])
        } else {
            return Double(nums3[midCount-1] + nums3[midCount]) / 2.0
        }
    }
}

// - MARK: 5. 最长回文子串
/*
 中心扩散算法 回文串特化算法
 */
extension HotProblem {
    func isSameChar(_ chars: [Character], _ left: Int, _ right: Int) -> Bool {
        return left >= 0 && right < chars.count && chars[left] == chars[right]
    }

    func longestResult(_ chars: [Character], _ left: Int, _ right: Int) -> (Int, Int) {
        var left = left
        var right = right
        while isSameChar(chars, left, right) {
            left -= 1
            right += 1
        }
        return (left + 1, right - 1)
        
    }

    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else { return s }
        let chars = [Character](s)
        var result: (Int, Int) = (0, 0)
        for index in chars.indices {
            let result1 = longestResult(chars, index, index)
            let result2 = longestResult(chars, index, index + 1)
            let maxResult = result1.1 - result1.0 > result2.1 - result2.0 ? result1 : result2
            result = maxResult.1 - maxResult.0 > result.1 - result.0 ? maxResult : result
        }
        return String(chars[result.0...result.1])
    }
}


// - MARK: 11. 盛最多水的容器
extension HotProblem {
    func maxArea(_ height: [Int]) -> Int {
        var res = 0
        var left = 0
        var right = height.count - 1
        while left < right {
            res = max(res, (right-left)*min(height[left], height[right]))
            if height[left] < height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        return res
    }
}
