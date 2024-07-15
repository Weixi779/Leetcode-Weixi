//
//  Hot100.swift
//  Leetcode-Weixi
//
//  Created by 孙世伟 on 2024/6/17.
//

import Foundation

class HotProblem {}

// MARK: 1. 两数之和
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

// MARK: 2. 两数相加
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

// MARK: 5. 最长回文子串
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


// MARK: 11. 盛最多水的容器
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

// MARK: 15. 三数之和
extension HotProblem {
//    // 暴力递归 倒是也过了
//    func threeSum(_ nums: [Int]) -> [[Int]] {
//        let nums = nums.sorted()
//        var result = [[Int]]()
//        var lastFirst = Int.min
//        var lastSecond = Int.min
//        for x in 0..<nums.count - 2 {
//            let firstValue = nums[x]
//            if firstValue > 0 { break }
//            if lastFirst == firstValue { continue }
//            lastFirst = firstValue
//            for y in x + 1..<nums.count - 1 {
//                let secondValue = nums[y]
//                if lastSecond == secondValue { continue }
//                lastSecond = secondValue
//                let target = -(firstValue + secondValue)
//                let isContains = nums[y + 1..<nums.count].contains(target)
//                if isContains {
//                    result.append([firstValue, secondValue, target])
//                }
//            }
//        }
//        return result
//    }
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var result = [[Int]]()
        for index in 0..<nums.count - 2 {
            if nums[index] > 0 { break }
            if index > 0 && nums[index] == nums[index-1] { continue }
            
            var left = index + 1
            var right = nums.count - 1
            while left < right {
                let sum = nums[index] + nums[left] + nums[right]
                if sum == 0 {
                    result.append([nums[index], nums[left], nums[right]])
                    while left < right && nums[left] == nums[left+1] { left += 1 }
                    while left < right && nums[right] == nums[right-1] { right -= 1 }
                    left += 1
                    right -= 1
                }
                if (sum < 0) { left += 1 }
                if (sum > 0) { right -= 1 }
            }
        }
        return result
    }
}

// MARK: 17. 电话号码的字母组合

extension HotProblem {
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else { return [] }
        let letterMap: [Character: [Character]] = [
            "2":["a","b","c"],
            "3":["d","e","f"],
            "4":["g","h","i"],
            "5":["j","k","l"],
            "6":["m","n","o"],
            "7":["p","q","r","s"],
            "8":["t","u","v"],
            "9":["w","x","y","z"]
        ]
        
        let letters: [[Character]] = digits.compactMap{ letterMap[$0] }
        var result = [String]()
        var tempString = ""
        letterCombinationsHelper(letters, 0, &tempString, &result)
        return result
    }
    
    func letterCombinationsHelper(_ letterMap: [[Character]],
                                  _ index: Int,
                                  _ tempString: inout String,
                                  _ result: inout [String]) {
        if index == letterMap.count {
            result.append(tempString)
            return
        }
        for char in letterMap[index] {
            tempString.append(char)
            letterCombinationsHelper(letterMap, index+1, &tempString, &result)
            tempString.removeLast()
        }
    }
}

// MARK: 19. 删除链表的倒数第 N 个结点
extension HotProblem {
   func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
       let dummy = ListNode(0, head)
       var slow = dummy
       var fast = dummy
       var step = 0
       while step != n, let next = fast.next {
           fast = next
           step += 1
       }
       while let fastNext = fast.next, let slowNext = slow.next {
           fast = fastNext
           slow = slowNext
       }
       slow.next = slow.next?.next
       return dummy.next
   }
}

// MARK: 20. 有效的括号
extension HotProblem {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        let popMap: [Character: Character] = [")":"(", "]":"[", "}":"{"]
        for char in s {
            if let value = popMap[char] {
                if stack.popLast() != value { return false }
            } else {
                stack.append(char)
            }
        }
        
        return stack.isEmpty
    }
}

// MARK: 21. 合并两个有序链表
extension HotProblem {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var node: ListNode? = dummy
        var node1 = list1
        var node2 = list2
        while let value1 = node1?.val, let value2 = node2?.val {
            if value1 < value2 {
                node?.next = node1
                node1 = node1?.next
            } else {
                node?.next = node2
                node2 = node2?.next
            }
            node = node?.next
        }
        node?.next = node1 ?? node2
        return dummy.next
    }
}

// MARK: 22. 括号生成
extension HotProblem {
    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        var tempString = ""
        generateParenthesisHelper(0, 0, n, &tempString, &result)
        return result
    }
    
    func generateParenthesisHelper(_ leftCount: Int, _ rightCount: Int, _ targetCount: Int, _ tempString: inout String, _ result: inout [String]) {
        if leftCount == targetCount && rightCount == targetCount {
            result.append(tempString)
            return
        }
        if leftCount < targetCount {
            tempString.append("(")
            generateParenthesisHelper(leftCount+1, rightCount, targetCount, &tempString, &result)
            tempString.removeLast()
        }
        
        if leftCount > rightCount {
            tempString.append(")")
            generateParenthesisHelper(leftCount, rightCount+1, targetCount, &tempString, &result)
            tempString.removeLast()
        }
    }
}
