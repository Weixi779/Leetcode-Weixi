//
//  Hot100.swift
//  Leetcode-Weixi
//
//  Created by 孙世伟 on 2024/6/17.
//

import Foundation

class HotProblem {}

// MARK: - 数组
extension HotProblem {
    // MARK: 1. 两数之和
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
    
    // - MARK: 4. 寻找两个正序数组的中位数
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
    
    // MARK: 11. 盛最多水的容器
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
    
    // MARK: 15. 三数之和
    // 暴力递归 倒是也过了
    func threeSumGeneral(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var result = [[Int]]()
        var lastFirst = Int.min
        var lastSecond = Int.min
        for x in 0..<nums.count - 2 {
            let firstValue = nums[x]
            if firstValue > 0 { break }
            if lastFirst == firstValue { continue }
            lastFirst = firstValue
            for y in x + 1..<nums.count - 1 {
                let secondValue = nums[y]
                if lastSecond == secondValue { continue }
                lastSecond = secondValue
                let target = -(firstValue + secondValue)
                let isContains = nums[y + 1..<nums.count].contains(target)
                if isContains {
                    result.append([firstValue, secondValue, target])
                }
            }
        }
        return result
    }
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
    
    // MARK: 48. 旋转图像
    func rotate(_ matrix: inout [[Int]]) {
        for i in matrix.indices {
            for j in 0..<i {
                (matrix[i][j], matrix[j][i]) = (matrix[j][i], matrix[i][j])
            }
        }
//        for x in 0..<(matrix.count/2) {
//            for y in 0..<matrix.count {
//                (matrix[x][y], matrix[x][matrix.count - y - 1]) = (matrix[x][matrix.count - y - 1], matrix[x][y])
//            }
//        }
        for i in 0..<matrix.count {
            matrix[i].reverse()
        }
    }
    
    // MARK: 56. 合并区间
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let intervals = intervals.sorted { $0[0] < $1[0] }
        var result = [[Int]]()
        for interval in intervals {
            if let last = result.last, interval[0] <= last[1] {
                result.removeLast()
                result.append([last[0], max(last[1], interval[1])])
            } else {
                result.append(interval)
            }
        }
        return result
    }
    
    // MARK: 75. 颜色分类
    func sortColors(_ nums: inout [Int]) {
        let count = nums.count
        var left = 0
        var right = count - 1
        var index = 0
        while index <= right {
            if nums[index] == 0 {
                nums.swapAt(index, left)
                left += 1
                index += 1
            } else if nums[index] == 2 {
                nums.swapAt(index, right)
                right -= 1
            } else if nums[index] == 1 {
                index += 1
            }
        }
    }
    
    // MARK: 169. 多数元素
    func majorityElement(_ nums: [Int]) -> Int {
        var hashMap = [Int: Int]()
        for num in nums {
            hashMap[num] = (hashMap[num] ?? 0) + 1
        }
        let result = hashMap
            .sorted { $0.value > $1.value }
            .first
        return result?.key ?? 0
    }
}

// MARK: - 滑动窗口
extension HotProblem {
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
    // MARK: 3. 无重复字符的最长子串
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

// MARK: - 中心扩散算法 (回文串特化算法)
extension HotProblem {
    // MARK: 5. 最长回文子串
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

// MARK: - DFS
extension HotProblem {
    // MARK: 17. 电话号码的字母组合
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
    
    // MARK: 22. 括号生成
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
    
    
    // MARK: 39. 组合总和
    func combinationSumHelper(_ candidates: [Int], _ target: Int, _ index: Int,  _ sum: Int, _ temp: inout [Int], _ result: inout [[Int]]) {
        if sum == target {
            result.append(temp)
            return
        }
        
        if sum > target {
            return
        }
        
        for i in index..<candidates.count {
            temp.append(candidates[i])
            combinationSumHelper(candidates, target, i, sum + candidates[i], &temp, &result)
            temp.removeLast()
        }
    }
    
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        var temp = [Int]()
        combinationSumHelper(candidates, target, 0, 0, &temp, &result)
        return result
    }
    
    // MARK: 46. 全排列
    func pernuteHelper(_ nums: [Int], _ hashMap: inout [Int: Bool], _ result: inout [[Int]], _ temp: inout [Int]) {
        if temp.count == nums.count {
            result.append(temp)
            return
        }
        
        for num in nums {
            if hashMap[num] == true { continue }
            temp.append(num)
            hashMap[num] = true
            pernuteHelper(nums, &hashMap, &result, &temp)
            let last = temp.removeLast()
            hashMap[last] = false
        }
    }
    
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var temp = [Int]()
        var hashMap = [Int: Bool]()
        pernuteHelper(nums, &hashMap, &result, &temp)
        return result
    }
    
    // MARK: 78. 子集
    func subsetsHelper(_ nums: inout [Int], _ temp: inout [Int], _ result: inout [[Int]], _ index: Int) {
        guard index <= nums.count else { return }
        
        result.append(temp)
        
        for i in index..<nums.count {
            temp.append(nums[i])
            subsetsHelper(&nums, &temp, &result, i+1)
            temp.removeLast()
        }
    }
    
    func subsets(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        var result = [[Int]]()
        var temp = [Int]()
        subsetsHelper(&nums, &temp, &result, 0)
        return result
    }
    
    // MARK: 79. 单词搜索
// BFS 版本
//    func exist(_ board: [[Character]], _ word: String) -> Bool {
//        guard let first = word.first else { return false }
//
//        let chars = [Character](word)
//
//        // 建立队列
//        var quques = [[(Int, Int)]]()
//        for x in board.indices {
//            for y in board[x].indices {
//                if board[x][y] == first {
//                    quques.append([(x, y)])
//                }
//            }
//        }
//        // 去除起始位置
//        for index in 1..<chars.count {
//            let target = chars[index]
//            var temp = [[(Int, Int)]]()
//            while !quques.isEmpty {
//                let queue = quques.removeFirst()
//                let nextQueues = existHelper(board, target, queue)
//                nextQueues.forEach { temp.append($0) }
//            }
//            quques = temp
//        }
//
//        return !quques.isEmpty
//    }
//
//    func existHelper(_ board: [[Character]], _ target: Character, _ queue: [(Int, Int)]) -> [[(Int, Int)]] {
//        let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
//        var reuslt = [[(Int, Int)]]()
//        let last = queue.last!
//        for direction in directions {
//            let x = last.0 + direction.0
//            let y = last.1 + direction.1
//
//            guard x >= 0 && x < board.count else { continue }
//            guard y >= 0 && y < board[x].count else { continue }
//
//            if board[x][y] == target && !queue.contains(where: { $0.0 == x && $0.1 == y}) {
//                reuslt.append(queue + [(x, y)])
//            }
//        }
//        return reuslt
//    }
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        guard !word.isEmpty else { return false }
        
        let chars = Array(word)
        
        for x in board.indices {
            for y in board[x].indices {
                if board[x][y] == chars[0] {
                    var visited = Set<[Int]>()
                    visited.insert([x, y])
                    if existHelper(board, chars, 1, (x, y), &visited) {
                        return true
                    }
                }
            }
        }
        
        return false
    }
    
    func existHelper(_ board: [[Character]], _ chars: [Character], _ target: Int, _ current: (Int, Int), _ visited: inout Set<[Int]>) -> Bool {
        if target == chars.count { return true }
        
        let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
        
        for direction in directions {
            let x = current.0 + direction.0
            let y = current.1 + direction.1
            
            guard x >= 0 && x < board.count else { continue }
            guard y >= 0 && y < board[x].count else { continue }
            
            if board[x][y] == chars[target] && !visited.contains([x, y]) {
                visited.insert([x, y])
                
                if existHelper(board, chars, target + 1, (x, y), &visited) {
                    return true
                }
                
                visited.remove([x, y])
            }
        }
        
        return false
    }
    
    // MARK: 200. 岛屿数量
    func numIslands(_ grid: [[Character]]) -> Int {
        var result = 0
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: grid[0].count), count: grid.count)
        for x in grid.indices {
            for y in grid[0].indices {
                if grid[x][y] == "1", visited[x][y] == false {
                    visited[x][y] = true
                    result += 1
                    numIslandsHelper((x, y), &visited, grid)
                }
            }
        }
        
        return result
    }
    
    private func numIslandsVaild(_ position: (Int, Int),
                                 _ direction: (Int, Int),
                                 _ limit: (Int, Int)
    ) -> Bool {
        let x = position.0 + direction.0
        let y = position.1 + direction.1
        return x >= 0 && x < limit.0 && y >= 0 && y < limit.1
    }
    
    func numIslandsHelper(_ position: (Int, Int),
                          _ visited: inout [[Bool]],
                          _ grid: [[Character]]) {
        let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
        
        for direction in directions {
            let isVaild = numIslandsVaild(position, direction, (grid.count, grid[0].count))
            guard isVaild else { continue }
            let x = position.0 + direction.0
            let y = position.1 + direction.1
            if grid[x][y] == "1" && visited[x][y] == false {
                visited[x][y] = true
                numIslandsHelper((x,y), &visited, grid)
            }
        }
    }
}

// MARK: - 栈
extension HotProblem {
    
    // MARK: 20. 有效的括号
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
    
    // MARK: 32. 最长有效括号
    func longestValidParentheses(_ s: String) -> Int {
        let chars = [Character](s)
        var stack = [Int]()
        var result = 0
        for i in chars.indices {
            if chars[i] == "(" {
                stack.append(i)
            } else {
                if let last = stack.last, chars[last] == "(" {
                    stack.removeLast()
                    result = max(result, i - last + 1)
                } else {
                    stack.append(i)
                }
            }
        }
        return result
    }
    
    // MARK: 155. 最小栈
    class MinStack {
        
        var stack: [(Int, Int)] = []
        
        init() {
        }

        func push(_ val: Int) {
            guard let last = stack.last else {
                stack.append((val, val))
                return
            }
            stack.append((val, min(last.1, val)))
        }
        
        func pop() {
            stack.removeLast()
        }
        
        func top() -> Int {
            return stack.last?.0 ?? -1
        }
        
        func getMin() -> Int {
            return stack.last?.1 ?? -1
        }
    }
}

// MARK: - 链表
extension HotProblem {
    // MARK: 2. 两数相加
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
    
    // MARK: 19. 删除链表的倒数第 N 个结点
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
    
    // MARK: 21. 合并两个有序链表
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
    
    // MARK: 23. 合并 K 个升序链表
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 0 else { return nil }
        guard lists.count > 1 else { return lists[0] }
        
        let mid = lists.count / 2
        
        let left = mergeKLists(Array(lists[0..<mid]))
        let right = mergeKLists(Array(lists[mid..<lists.count]))
        
        return mergeTwoLists(left, right)
    }
    
    // MARK: 141. 环形链表
    func hasCycle(_ head: ListNode?) -> Bool {
        var fast = head
        var slow = head
        
        while fast != nil {
            fast = fast?.next?.next
            if slow === fast {
                return true
            }
            slow = slow?.next
        }
        return false
    }
    
    // MARK: 142. 环形链表 II
    func detectCycle(_ head: ListNode?) -> ListNode? {
        var fast = head
        var slow = head
        var node: ListNode?
        
        while fast != nil, fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow === fast {
                node = head
                break
            }
        }
        
        guard node != nil else { return nil }
        
        while node !== slow {
            node = node?.next
            slow = slow?.next
        }
        return node
    }
    
    // MARK: 146. LRU 缓存
    class LRUCache {
        
        class DoublyNode {
            var key: Int
            var value: Int
            var previous: DoublyNode?
            var next: DoublyNode?
            
            init(key: Int, value: Int, previous: DoublyNode? = nil, next: DoublyNode? = nil) {
                self.key = key
                self.value = value
                self.previous = previous
                self.next = next
            }
        }
        
        var max: Int
        var firstNode: DoublyNode?
        var lastNode: DoublyNode?
        var map: [Int: DoublyNode]

        init(_ capacity: Int) {
            self.max = capacity
            self.firstNode = nil
            self.lastNode = nil
            self.map = [Int: DoublyNode]()
        }
        
        func get(_ key: Int) -> Int {
            guard let node = self.map[key] else { return -1 }
            self.moveToLast(node)
            return node.value
        }
        
        func put(_ key: Int, _ value: Int) {
            guard map[key] == nil else {
                let node = map[key]!
                node.value = value
                moveToLast(node)
                return
            }
            
            if map.keys.count == max {
                if let firstNode = firstNode {
                    map.removeValue(forKey: firstNode.key)
                    removeNode(firstNode)
                }
            }
            
            let newNode = DoublyNode(key: key, value: value)
            addNodeToLast(newNode)
            map[key] = newNode
        }
        
        private func moveToLast(_ node: DoublyNode) {
            removeNode(node)
            addNodeToLast(node)
        }
        
        private func removeNode(_ node: DoublyNode) {
            if let prev = node.previous {
                prev.next = node.next
            } else {
                firstNode = node.next
            }
            
            if let next = node.next {
                next.previous = node.previous
            } else {
                lastNode = node.previous
            }
            
            node.previous = nil
            node.next = nil
        }
        
        private func addNodeToLast(_ node: DoublyNode) {
            guard let last = lastNode else {
                firstNode = node
                lastNode = node
                return
            }
            last.next = node
            node.previous = last
            lastNode = node
        }
    }
    
    // MARK: 148. 排序链表
    func sortList(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }
        
        var nodes = [ListNode]()
        var current: ListNode? = head
        
        while current != nil {
            nodes.append(current!)
            current = current?.next
        }
        
        nodes.sort { $0.val < $1.val }
        
        for index in 0..<nodes.count - 1 {
            nodes[index].next = nodes[index + 1]
        }
        
        nodes.last?.next = nil
        
        return nodes.first
    }
    
    // MARK: 160. 相交链表
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        guard let headA = headA, let headB = headB else { return nil }
        var nodeA: ListNode? = headA
        var nodeB: ListNode? = headB
        
        while nodeA !== nodeB {
            nodeA = (nodeA != nil) ? nodeA?.next : headB
            nodeB = (nodeB != nil) ? nodeB?.next : headA
        }
        
        return nodeA
    }
    
    // MARK: 206. 反转链表
    func reverseList(_ head: ListNode?) -> ListNode? {
        let dummy: ListNode? = ListNode(-1, head)
        let current = head
        while let next = current?.next {
            current?.next = next.next
            next.next = dummy?.next
            dummy?.next = next
        }
        return dummy?.next
    }
}

// MARK: - 二分查找
extension HotProblem {
    // 最普通的二分查找
    //func binarySearch(_ nums: [Int], _ target: Int) -> Int {
    //    var left = 0
    //    var right = nums.count - 1
    //
    //    while left <= right {
    //        let mid = (left + right) / 2
    //
    //        if target == nums[mid] {
    //            return mid
    //        } else if target < nums[mid] {
    //            right = mid - 1
    //        } else {
    //            left = mid + 1
    //        }
    //    }
    //
    //    return -1
    //}
    
    // MARK: 33. 搜索旋转排序数组
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
            
        while left <= right {
            let mid = (left + right) / 2
                
            if target == nums[mid] { return mid }
                
            if nums[left] <= nums[mid] {
                if target >= nums[left] && target < nums[mid] {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            } else {
                if target > nums[mid] && target <= nums[right] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
        }
            
        return -1
    }
    
    // MARK: 34. 在排序数组中查找元素的第一个和最后一个位置
    func searchRangeHelper(_ nums: [Int], _ target: Int, _ isLower: Bool) -> Int {
        var left = 0
        var right = nums.count - 1
        var result = -1

        while left <= right {
            let mid = (left + right) / 2
            if nums[mid] == target {
                result = mid
                if isLower {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
            else if target > nums[mid] {
                left = mid + 1
            } else if target < nums[mid] {
                right = mid - 1
            }
        }
        
        return result
    }
    
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 0 else { return [-1, -1] }
        let first = searchRangeHelper(nums, target, true)
        let second = searchRangeHelper(nums, target, false)
        return [first, second]
    }
}

// MARK: - 哈希
extension HotProblem {
    // MARK: 49. 字母异位词分组
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var hashMap = [[Character]: [String]]()
        for str in strs {
            let chars = Array(str).sorted()
            hashMap[chars] = (hashMap[chars] ?? []) + [str]
        }
        return hashMap.map { $0.value }
    }
    
    // MARK: 128. 最长连续序列
    func longestConsecutive(_ nums: [Int]) -> Int {
        var map = [Int: Bool]()
        for num in nums {
            map[num] = true
        }
        var result = 0
        for num in map.keys {
            if map[num - 1] == true { continue }
            var temp = 1
            var start = num
            while let _ = map[start + 1] {
                temp += 1
                start += 1
            }
            result = max(result, temp)
        }
        return result
    }
}

// MARK: - 动态规划专项
extension HotProblem {
    // MARK: 55. 跳跃游戏
    func canJump(_ nums: [Int]) -> Bool {
        var k = 0
        for index in nums.indices {
            if index > k { return false }
            k = max(k, index + nums[index])
        }
        return true
    }
    
    // MARK: 62. 不同路径
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        for x in 0..<m {
            for y in 0..<n {
                if x == 0 || y == 0 {
                    dp[x][y] = 1
                } else {
                    dp[x][y] = dp[x-1][y] + dp[x][y-1]
                }
            }
        }
        return dp[m-1][n-1]
    }
    
    // MARK: 64. 最小路径和
    func minPathSum(_ grid: [[Int]]) -> Int {
        var dp = grid

        for x in dp.indices {
            for y in dp[x].indices {
                switch (x, y) {
                case (0, 0):
                    continue
                case (0, _):
                    dp[x][y] += dp[x][y - 1]
                case (_, 0):
                    dp[x][y] += dp[x - 1][y]
                default:
                    dp[x][y] += min(dp[x - 1][y], dp[x][y - 1])
                }
            }
        }

        return dp[dp.count - 1][dp[0].count - 1]
    }
    
    // MARK: 70. 爬楼梯
    func climbStairs(_ n: Int) -> Int {
        guard n > 2 else { return n }

        var dp: [Int] = [Int](repeating: 0, count: n)

        for i in 0..<n {
            if i <= 2 {
                dp[i] = n
            } else {
                dp[i] = dp[i - 1] + dp[i - 2]
            }
        }
        return dp[n - 1]
    }
    
    // MARK: 121. 买卖股票的最佳时机
    func maxProfit(_ prices: [Int]) -> Int {
        var tradeIn = Int.max
        var result = 0
        for price in prices {
            tradeIn = min(price, tradeIn)
            result = max(result, price - tradeIn)
        }
        return result
    }
    
    // MARK: 139. 单词拆分
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var dp = [Bool](repeating: false, count: s.count + 1)
        dp[0] = true
        
        let chars = [Character](s)
        
        for i in 1...chars.count {
            for j in 0..<i {
                let word = String(chars[j..<i])
                if dp[j] && wordDict.contains(word) {
                    dp[i] = true
                    break
                }
            }
        }
        
        return dp[s.count]
    }
    
    // MARK: 198. 打家劫舍
    func rob(_ nums: [Int]) -> Int {
        var dp = [Int]()
        // dp 的 索引比 index 多一个
        dp.append(0)
        for index in nums.indices {
            // 不需要求和
            guard index != 0 else {
                dp.append(nums[index])
                continue
            }
            
            dp.append(max(dp[index], dp[index-1] + nums[index]))
        }
        
        return dp.last ?? 0
    }
}

// MARK: - 树 专项
extension HotProblem {
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
    
    // MARK: 94. 二叉树的中序遍历
    // 递归
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        return inorderTraversal(root.left) + [root.val] + inorderTraversal(root.right)
    }
    // 遍历
//    func inorderTraversal(_ root: TreeNode?) -> [Int] {
//        var result = [Int]()
//        var stack = [TreeNode]()
//        var current = root
//        
//        while current != nil || !stack.isEmpty {
//            // 先遍历到最左边的节点
//            while let node = current {
//                stack.append(node)
//                current = node.left
//            }
//            // 处理最左边的节点
//            current = stack.removeLast()
//            result.append(current!.val)
//            // 遍历右子树
//            current = current?.right
//        }
//        
//        return result
//    }
    
    // MARK: 98. 验证二叉搜索树 / 可用中序遍历方案 /
    func isValidBST(_ root: TreeNode?) -> Bool {
        return isValidBSTHelper(root, nil, nil)
    }

    func isValidBSTHelper(_ node: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {
        guard let node = node else { return true }
        
        if let min = min, node.val <= min { return false }
        if let max = max, node.val >= max { return false }
        
        return isValidBSTHelper(node.left, min, node.val) && isValidBSTHelper(node.right, node.val, max)
    }
    
    // MARK: 101. 对称二叉树
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        return isSymmetricHelper(root.left, root.right)
    }
    
    func isSymmetricHelper(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil { return true }
        guard let left = left, let right = right else { return false }
        return left.val == right.val && isSymmetricHelper(left.left, right.right) && isSymmetricHelper(left.right, right.left)
        // 注意入参内容
    }
    
    // MARK: 102. 二叉树的层序遍历
//    // - 递归写法
//    func levelOrder(_ root: TreeNode?) -> [[Int]] {
//        var result = [[Int]]()
//        levelOrderHelper(root, 0, &result)
//        return result
//    }
//    
//    func levelOrderHelper(_ root: TreeNode?, _ height: Int, _ result: inout [[Int]]) {
//        guard let root = root else { return }
//        if result.count <= height { result.append([Int]()) }
//        result[height].append(root.val)
//        levelOrderHelper(root.left, height + 1, &result)
//        levelOrderHelper(root.right, height + 1, &result)
//    }
//    // - 遍历写法
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [[Int]]() }
        var result = [[Int]]()
        var queue: [TreeNode] = [root]
        while !queue.isEmpty {
            result.append( queue.map {$0.val} )
            var next = [TreeNode]()
            for node in queue {
                if let left = node.left { next.append(left) }
                if let right = node.right { next.append(right) }
            }
            queue = next
        }
        return result
    }
    
    // MARK: 104. 二叉树的最大深度
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return max(maxDepth(root.left), maxDepth(root.right)) + 1
    }
    
    // MARK: 114. 二叉树展开为链表
    func flatten(_ root: TreeNode?) {
        guard let root = root else { return }
        let nodes = flattenHelper(root)
        for index in 0..<nodes.count - 1 {
            nodes[index].right = nodes[index + 1]
            nodes[index].left = nil
        }
    }
    
    func flattenHelper(_ root: TreeNode?) -> [TreeNode] {
        guard let root = root else { return [] }
        return [root] + flattenHelper(root.left) + flattenHelper(root.right)
    }
}


// MARK: - 位运算
extension HotProblem {
    // MARK: 136. 只出现一次的数字
    func singleNumber(_ nums: [Int]) -> Int {
//        var bits = 0
//        for num in nums {
//            bits ^= num
//        }
//        return bits
        return nums.reduce(0, ^)
    }
}

struct HotProblem2025 {
    /*
     1. 两数之和
     给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。
     你可以假设每种输入只会对应一个答案，并且你不能使用两次相同的元素。
     你可以按任意顺序返回答案。
     */
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
//        // 法1: 双层循环
//        for outer in 0..<nums.count - 1 {
//            for inner in outer+1..<nums.count {
//                let targetValue = target - nums[outer]
//                if targetValue == nums[inner] {
//                    return [outer, inner]
//                }
//            }
//        }
        
//        // 法2: 两次遍历
//        var map = Dictionary(uniqueKeysWithValues: nums.enumerated().map { ($1, $0) })
//
//        var map = nums.enumerated().reduce(into: [Int: Int]()) { result, reducer in
//            result[reducer.element] = reducer.offset
//        }
//        
//        for (num, index) in map {
//            let targetValue = target - num
//            if let targetIndex = map[targetValue], targetIndex != index {
//                return [index, targetIndex]
//            }
//        }
        
//        // 法3: 一次遍历
//        var map = [Int: Int]()
//        
//        for (index, num) in nums.enumerated() {
//            let targetValue = target - num
//            if let targetIndex = map[targetValue] {
//                return [index, targetIndex]
//            }
//            map[num] = index
//        }
        
        return []
    }
    
    /*
     2. 两数相加
     给你两个 非空 的链表，表示两个非负的整数。它们每位数字都是按照 逆序 的方式存储的，并且每个节点只能存储 一位 数字。
     请你将两个数相加，并以相同形式返回一个表示和的链表。
     你可以假设除了数字 0 之外，这两个数都不会以 0 开头。
     */
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy: ListNode = .init()
        var current = dummy
        
        var (node1, node2) = (l1, l2)
        var carry = 0
        
        while node1 != nil || node2 != nil || carry > 0 {
            let sum = (node1?.val ?? 0) + (node2?.val ?? 0) + carry
            
            carry = sum / 10
            
            let node: ListNode = .init(sum % 10)
            current.next = node
            current = node
            
            node1 = node1?.next
            node2 = node2?.next
        }
        
        return dummy.next
    }
    
    /*
     4. 寻找两个正序数组的中位数
     给定两个大小分别为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。请你找出并返回这两个正序数组的 中位数 。
     算法的时间复杂度应该为 O(log (m+n)) 。
     */
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        // 0,1,2 count = 3 => result = 1
        // 0,1,2,3 count = 4 => result = 1, 2
        let sorted = (nums1 + nums2).sorted()
        let count = sorted.count
        let mid = count / 2
        if count % 2 == 0 {
            return Double(sorted[mid - 1] + sorted[mid]) / 2.0
        } else {
            return Double(sorted[mid])
        }
    }
    /*
     11. 盛最多水的容器
     给定一个长度为 n 的整数数组 height 。有 n 条垂线，第 i 条线的两个端点是 (i, 0) 和 (i, height[i]) 。
     找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
     返回容器可以储存的最大水量。
     */
    func maxArea(_ height: [Int]) -> Int {
        var result = 0
        var left = 0
        var right = height.count - 1
        
        while left < right {
            let area = (right - left) * min(height[left], height[right])
            
            result = max(result, area)
            
            if height[left] > height[right] {
                right -= 1
            } else {
                left += 1
            }
        }
        
        return result
    }
    
    /*
     15. 三数之和
     给你一个整数数组 nums ，判断是否存在三元组 [nums[i], nums[j], nums[k]] 满足 i != j、i != k 且 j != k ，同时还满足 nums[i] + nums[j] + nums[k] == 0 。请你返回所有和为 0 且不重复的三元组。
     注意：答案中不可以包含重复的三元组。
     */
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var result = Set<[Int]>()
        
        for index in nums.indices {
            if (nums[index] > 0) { break }
            
            if (index > 0 && nums[index] == nums[index - 1]) { continue }
            
            var left = index + 1
            var right = nums.count - 1
            
            while right > left {
                if (nums[index] + nums[left] + nums[right]) > 0 {
                    right -= 1
                } else if (nums[index] + nums[left] + nums[right]) < 0 {
                    left += 1
                } else {
                    result.insert([nums[index],nums[left],nums[right]])
                    
                    while right > left && nums[right] == nums[right - 1] { right -= 1}
                    while right > left && nums[left] == nums[left + 1] { left += 1}
                    
                    right -= 1
                    left += 1
                }
            }
        }
        
        return result.map { $0 }
    }
    
    /*
     48. 旋转图像
     给定一个 n × n 的二维矩阵 matrix 表示一个图像。请你将图像顺时针旋转 90 度。
     你必须在 原地 旋转图像，这意味着你需要直接修改输入的二维矩阵。请不要 使用另一个矩阵来旋转图像。
     */
    func rotate(_ matrix: inout [[Int]]) {
        for row in matrix.indices {
            for col in 0..<row {
                (matrix[row][col], matrix[col][row]) = (matrix[col][row], matrix[row][col])
            }
        }
        
        for row in matrix.indices {
            matrix[row] = matrix[row].reversed()
        }
    }
    
    
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 0 {
            return Double(1)
        }
        let origin = x
        var result = Double(1)
        for _ in 0..<abs(n) {
            result *= origin
        }
        if n > 0 {
            return result
        } else {
            return 1 / result
        }
    }
    
    /*
     56. 合并区间
     以数组 intervals 表示若干个区间的集合，其中单个区间为 intervals[i] = [starti, endi] 。请你合并所有重叠的区间，并返回
     一个不重叠的区间数组，该数组需恰好覆盖输入中的所有区间 。
     */
    
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var result = [[Int]]()
        let intervals = intervals.sorted { $0[0] < $1[0] }
        for interval in intervals {
            if let last = result.last, last[1] >= interval[0] {
                result.removeLast()
                result.append([last[0], max(last[1], interval[1])])
            } else {
                result.append(interval)
            }
        }
        return result
    }
    
    /*
     75. 颜色分类
     给定一个包含红色、白色和蓝色、共 n 个元素的数组 nums ，原地 对它们进行排序，使得相同颜色的元素相邻，并按照红色、白色、蓝色顺序排列。
     我们使用整数 0、 1 和 2 分别表示红色、白色和蓝色。
     必须在不使用库内置的 sort 函数的情况下解决这个问题。
     */
    
    func sortColors(_ nums: inout [Int]) {
        var left = 0
        var right = nums.count - 1
        var index = 0
        
        while index < right {
            if nums[index] == 0 {
                nums.swapAt(index, left)
                left += 1
                index += 1
            } else if nums[index] == 2 {
                nums.swapAt(index, right)
                right -= 1
            } else if nums[index] == 1 {
                index += 1
            }
        }
    }
    
    /*
     JZ3 数组中重复的数字
     在一个长度为n的数组里的所有数字都在0到n-1的范围内。 数组中某些数字是重复的，但不知道有几个数字是重复的。也不知道每个数字重复几次。请找出数组中任意一个重复的数字。 例如，如果输入长度为7的数组[2,3,1,0,2,5,3]，那么对应的输出是2或者3。存在不合法的输入的话输出-1
     */
    
    func duplicate ( _ numbers: [Int]) -> Int {
        guard numbers.count > 0 else { return -1 }
        
        var result = -1
        var map = [Int: Int]() // 值: 出现次数
        
        for number in numbers {
            map[number] = (map[number] ?? 0) + 1
            if map[number]! > (map[result] ?? 0) {
                result = number
            }
        }
        
        return result
    }
    
    /*
     JZ4 二维数组中的查找
     在一个二维数组array中（每个一维数组的长度相同），每一行都按照从左到右递增的顺序排序，每一列都按照从上到下递增的顺序排序。请完成一个函数，输入这样的一个二维数组和一个整数，判断数组中是否含有该整数。
     [
     [1,2,8,9],
     [2,4,9,12],
     [4,7,10,13],
     [6,8,11,15]
     ]
     给定 target = 7，返回 true。

     给定 target = 3，返回 false。

     */
    
    func Find ( _ target: Int,  _ array: [[Int]]) -> Bool {
        guard array.count > 0, array[0].count > 0 else { return false }
        
        var row = array.count - 1
        var col = 0
        
        while row >= 0 && col < array[0].count {
            if target == array[row][col] {
                return true
            } else if target < array[row][col] {
                row -= 1
            } else {
                col += 1
            }
        }
        
        return false
    }
    
    /*
     JZ5 替换空格
     请实现一个函数，将一个字符串s中的每个空格替换成“%20”。
     例如，当字符串为We Are Happy.则经过替换之后的字符串为We%20Are%20Happy。

     数据范围:
     0≤len(s)≤1000。保证字符串中的字符为大写英文字母、小写英文字母和空格中的一种。
     */
    
    func replaceSpace ( _ s: String) -> String {
//        return s.replacingOccurrences(of: " ", with: "%20")
        var result = ""
        for index in s.indices {
            if s[index] == " " {
                result.append("%20")
            } else {
                result.append(s[index])
            }
        }
        return result
    }
    
    /*
     JZ29 顺时针打印矩阵
     输入一个矩阵，按照从外向里以顺时针的顺序依次打印出每一个数字，例如，如果输入如下4 X 4矩阵：
     [
      [1,2,3,4],
      [5,6,7,8],
      [9,10,11,12],
      [13,14,15,16]
     ]
     [1,2,3,4,8,12,16,15,14,13,9,5,6,7,11,10]
     */
    
    func printMatrix ( _ matrix: [[Int]]) -> [Int] {
        guard matrix.count > 0, matrix[0].count > 0 else { return [Int]() }
        var result = [Int]()
        var left = 0
        var right = matrix[0].count - 1
        var top = 0
        var bottom = matrix.count - 1
        
        while left <= right && top <= bottom {
            for y in left...right {
                result.append(matrix[top][y])
            }
            top += 1
            if top > bottom { break }
            
            for x in top...bottom {
                result.append(matrix[x][right])
            }
            right -= 1
            if left > right { break }
            
            for y in (left...right).reversed() {
                result.append(matrix[bottom][y])
            }
            bottom -= 1
            if top > bottom { break }
            
            for x in (top...bottom).reversed() {
                result.append(matrix[x][left])
            }
            left += 1
            if left > right { break }
        }
            
        return result
    }
    
    /*
     JZ50 第一个只出现一次的字符
     在一个长为 字符串中找到第一个只出现一次的字符,并返回它的位置, 如果没有则返回 -1（需要区分大小写）.（从0开始计数）

     */
    func FirstNotRepeatingChar ( _ str: String) -> Int {
        let chars = [Character](str)
        var map = [Character: Int]()
        
        for char in chars {
            map[char] = (map[char] ?? 0) + 1
        }
        
        for index in chars.indices {
            if let value = map[chars[index]], value == 1 {
                return index
            }
        }
        
        return -1
    }
    
    /*
     20. 有效的括号
     给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串 s ，判断字符串是否有效。

     有效字符串需满足：

     左括号必须用相同类型的右括号闭合。
     左括号必须以正确的顺序闭合。
     每个右括号都有一个对应的相同类型的左括号。
     */
    
    func isValid(_ s: String) -> Bool {
        var stack: [Character] = .init()
        let bracketMap: [Character: Character] = [")":"(", "}": "{", "]":"["]
        
        for char in [Character](s) {
            if let bracketPair = bracketMap[char], stack.last == bracketPair {
                stack.removeLast()
            } else {
                stack.append(char)
            }
        }
        
        return stack.isEmpty
    }
    
    /*
     32. 最长有效括号
     给你一个只包含 '(' 和 ')' 的字符串，找出最长有效（格式正确且连续）括号子串的长度。
     */
    func longestValidParentheses(_ s: String) -> Int {
        let chars = [Character](s)
        var stack: [Int] = [-1]
        var result: Int = 0
        
        for index in chars.indices {
            if chars[index] == "(" {
                stack.append(index)
            } else if chars[index] == ")" {
                if stack.count > 1 && chars[stack.last!] == "(" {
                    stack.removeLast()
                    result = max(result, index - stack.last!)
                } else {
                    stack.append(index)
                }
            }
        }
        
        return result
    }
    
    /*
     JZ9 用两个栈实现队列
     用两个栈来实现一个队列，使用n个元素来完成 n 次在队列尾部插入整数(push)和n次在队列头部删除整数(pop)的功能。 队列中的元素为int类型。保证操作合法，即保证pop操作时队列内已有元素。
     */
    
    class TwoStackForQueue {
        var empty: [Int] = .init()
        var stack: [Int] = .init()
        
        func push ( _ node: Int) {
            while stack.last != nil {
                empty.append(stack.removeLast())
            }
            
            stack.append(node)
            
            while empty.last != nil {
                stack.append(empty.removeLast())
            }
        }
        
        func pop () -> Int {
            return stack.removeLast()
        }
    }
    
    /*
     JZ30 包含min函数的栈
     定义栈的数据结构，请在该类型中实现一个能够得到栈中所含最小元素的 min 函数，输入操作时保证 pop、top 和 min 函数操作时，栈中一定有元素。
     */
    
    class StackWithMinFunction {
        
        var valueStack: [Int] = .init()
        
        var minStack: [Int] = .init()
        
        func push ( _ value: Int) {
            
            valueStack.append(value)
            
            if let last = minStack.last {
                minStack.append(Swift.min(value, last))
            } else {
                minStack.append(value)
            }
        }

        func pop () {
            valueStack.removeLast()
            minStack.removeLast()
        }
        
        func top () -> Int {
            return valueStack.last!
        }
        
        func min () -> Int {
            return minStack.last!
        }
           
    }
    
    /*
     JZ31 栈的压入、弹出序列
     输入两个整数序列，第一个序列表示栈的压入顺序，请判断第二个序列是否可能为该栈的弹出顺序。假设压入栈的所有数字均不相等。例如序列1,2,3,4,5是某栈的压入顺序，序列4,5,3,2,1是该压栈序列对应的一个弹出序列，但4,3,5,1,2就不可能是该压栈序列的弹出序列。
     */
    
    func IsPopOrder ( _ pushV: [Int],  _ popV: [Int]) -> Bool {
        var stack: [Int] = .init()
        
        var popValue = popV
        
        for push in pushV {
            stack.append(push)
            
            while !stack.isEmpty, stack.last == popValue.first {
                stack.removeLast()
                popValue.removeFirst()
            }
        }
        
        return stack.isEmpty
    }
    
    /*
     JZ40 最小的K个数
     给定一个长度为 n 的可能有重复值的数组，找出其中不去重的最小的 k 个数。例如数组元素是4,5,1,6,2,7,3,8这8个数字，则最小的4个数字是1,2,3,4(任意顺序皆可)。
     */
//    func GetLeastNumbers_Solution ( _ input: [Int],  _ k: Int) -> [Int] {
//        guard input.count > 0, k > 0 else { return [] }
//        
//        var heap = Heap<Int>(orderingAt: >)
//        
//        for num in nums {
//            if heap.count < k {
//                // 如果堆未满，直接添加元素
//                heap.insert(num)
//            } else if let maxElement = heap.peek(), num < maxElement {
//                // 如果当前元素比堆顶小，移除堆顶并添加当前元素
//                _ = heap.popMax()
//                heap.insert(num)
//            }
//        }
//        
//        // 将堆中的元素转换为数组并返回
//        return heap.unordered
//    }
    
    class FirstDifferenceCharacter {
        var queue: [Character] = .init()
        var map: [Character] = .init()
        
        func Insert ( _ ch: Character) {
            if queue.contains(ch) {
                if let index = queue.firstIndex(of: ch) {
                    queue.remove(at: index)
                    map.append(ch)
                }
            } else if !map.contains(ch) {
                queue.append(ch)
            }
        }
        
        func FirstAppearingOnce () -> Character {
            return queue.first ?? "#"
        }
    }
    
    class MaxValueForWindow {
        func maxInWindows ( _ num: [Int],  _ size: Int) -> [Int] {
            guard size > 0 else { return [] }
            var queue: [Int] = .init()
            
            var result: [Int] = .init()
            
            for n in num {
                queue.append(n)
                
                if queue.count > size {
                    queue.removeFirst()
                }
                
                if queue.count == size {
                    result.append(queue.max()!)
                }
            }
            
            return result
        }
    }
    
    func FindNumbersWithSum ( _ array: [Int],  _ sum: Int) -> [Int] {
        guard array.count > 0 else { return [] }
        var left: Int = 0
        var right: Int = array.count - 1
        
        while left < right {
            let currentSum = array[left] + array[right]
            if currentSum == sum {
                return [array[left], array[right]]
            } else if currentSum < sum {
                left += 1
            } else if currentSum > sum {
                right -= 1
            }
        }
        
        return []
    }
    
    func ReverseSentence ( _ ReverseSentence: String) -> String {
        if ReverseSentence.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return ReverseSentence
        }
        
        return ReverseSentence.split(separator: " ").reversed().joined(separator: " ")
    }
    
    func LeftRotateString ( _ str: String,  _ n: Int) -> String {
        guard str.count > 0 else { return "" }
        
        var string = str

        let index = n % str.count

        var prefixChars = [Character]()

        for _ in 0..<index {
            prefixChars.append(string.removeFirst())
        }

        string += prefixChars.map { String($0) }.joined()
        
        return string
    }
    
    func reverseList(_ head: ListNode?) -> ListNode? {
        let dummy: ListNode = .init()
        var node: ListNode? = head
        
        while node != nil {
            let next = node?.next
            node?.next = dummy.next
            dummy.next = node
            node = next
        }
        
        return dummy.next
    }
    
    /*
     144. 二叉树的前序遍历
     给你二叉树的根节点 root ，返回它节点值的 前序 遍历。
     */
    
    func preorderTraversal_recursive(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        return [root.val] + preorderTraversal_recursive(root.left) + preorderTraversal_recursive(root.right)
    }
    
    // 根 -> 左 -> 右
    func preorderTraversal_iterative(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        var result: [Int] = .init()
        var stack: [TreeNode] = [root]
        
        while let node = stack.popLast() {
            result.append(node.val)
            // 因为是栈 所以先右后左
            if let right = root.right { stack.append(right) }
            
            if let left = node.left { stack.append(left) }
        }
        
        return result
    }
    
    /*
     94. 二叉树的中序遍历
     给定一个二叉树的根节点 root ，返回 它的 中序 遍历 。
     */
    func inorderTraversal_recursive(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        return inorderTraversal_recursive(root.left) + [root.val] + inorderTraversal_recursive(root.right)
    }
    
    func inorderTraversal_iterative(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        var result: [Int] = .init()
        var stack: [TreeNode] = .init()
        var node: TreeNode? = root
        
        while node != nil || !stack.isEmpty {
            while let current = node {
                stack.append(current)
                node = current.left
            }
            
            let current = stack.removeLast()
            result.append(current.val)
            
            node = node?.right
        }
        
        return result
    }
    
    func postorderTraversal_recursive(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        return postorderTraversal_recursive(root.left) + postorderTraversal_recursive(root.right) + [root.val]
    }
    
    func postorderTraversal_iterative(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        
        var result: [Int] = .init()
        var stack1: [TreeNode] = [root]
        var stack2 = [TreeNode]()
        
        while !stack1.isEmpty {
            let node = stack1.removeLast()
            stack2.append(node)
            
            // 注意：先压左，再压右（这样出栈是根→右→左）
            if let left = node.left {
                stack1.append(left)
            }
            if let right = node.right {
                stack1.append(right)
            }
        }
        
        // stack2中是“根 → 右 → 左”，翻转后就是后序遍历
        while !stack2.isEmpty {
            result.append(stack2.removeLast().val)
        }
        
        return result
    }
    
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        var result = [[Int]]()
        var queue: [TreeNode] = [root]
        
        while !queue.isEmpty {
            result.append(queue.map { $0.val })
            var nextLevel: [TreeNode] = .init()
            
            for node in queue {
                if let left = node.left {
                    nextLevel.append(left)
                }
                if let right = node.right {
                    nextLevel.append(right)
                }
            }
            
            queue = nextLevel
        }
        
        return result
    }
    
    
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        var queue: [TreeNode] = [root]
        var result = 0

        while !queue.isEmpty {
            var next: [TreeNode] = .init()
            
            for node in queue {
                if let left = node.left {
                    next.append(left)
                }
                if let right = node.right {
                    next.append(right)
                }
            }
            result += 1
            queue = next
        }
        
        return result
    }
    /*
     101. 对称二叉树
     给你一个二叉树的根节点 root ， 检查它是否轴对称。
     */
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isSymmetricHelper(root?.left, root?.right)
    }
    
    func isSymmetricHelper(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil { return true }
        
        if left?.val != right?.val { return false }
        
        return isSymmetricHelper(left?.left, right?.right) && isSymmetricHelper(left?.right, right?.left)
    }
    
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        let left = invertTree(root.right)
        let right = invertTree(root.left)
        root.right = left
        root.left = right
        return root
    }
    
    func invertTree_iterative(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }
        
        var queue: [TreeNode] = [root]
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            if node.left != nil || node.right != nil {
                let left = node.left
                let right = node.right
                node.left = right
                node.right = left
            }
            
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
        }
        
        return root
    }
    
    /*
     17. 电话号码的字母组合
     给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。答案可以按 任意顺序 返回。
     给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
     */
    
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else { return [] }
        let letterMap : [Character:[Character]] = [
            "1":[],
            "2":["a","b","c"],
            "3":["d","e","f"],
            "4":["g","h","i"],
            "5":["j","k","l"],
            "6":["m","n","o"],
            "7":["p","q","r","s"],
            "8":["t","u","v"],
            "9":["w","x","y","z"]
        ]
        
        var result: [String] = []
        var current: String = ""
        let map: [[Character]] = digits.compactMap { letterMap[$0] }
        letterCombinationsHelper(map: map, index: 0, current: &current, result: &result)
        
        return result
    }
    
    func letterCombinationsHelper(
        map: [[Character]],
        index: Int,
        current: inout String,
        result: inout [String]
    ) {
        if index == map.count {
            result.append(current)
            return
        }
        
        for char in map[index] {
            current.append(char)
            letterCombinationsHelper(map: map, index: index + 1, current: &current, result: &result)
            current.removeLast()
        }
    }
    
    /*
     22. 括号生成
     数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且 有效的 括号组合。
     */
    func generateParenthesis(_ n: Int) -> [String] {
        guard n > 0 else { return [] }
        
        var result: [String] = .init()
        var current: String = ""
        generateParenthesisHelper(n, 0, 0, &current, &result)
        return result
    }
    
    func generateParenthesisHelper(
        _ target: Int,
        _ leftCount: Int,
        _ rightCount: Int,
        _ current: inout String,
        _ result: inout [String]
    ) {
        if leftCount == target && rightCount == target {
            result.append(current)
            return
        }
        
        if leftCount < target {
            current.append("(")
            generateParenthesisHelper(target, leftCount + 1, rightCount, &current, &result)
            current.removeLast()
        }
        
        if leftCount > rightCount {
            current.append(")")
            generateParenthesisHelper(target, leftCount, rightCount + 1, &current, &result)
            current.removeLast()
        }
    }
    
    /*
     39. 组合总和
     给你一个 无重复元素 的整数数组 candidates 和一个目标整数 target ，找出 candidates 中可以使数字和为目标数 target 的 所有 不同组合 ，并以列表形式返回。你可以按 任意顺序 返回这些组合。
     candidates 中的 同一个 数字可以 无限制重复被选取 。如果至少一个数字的被选数量不同，则两种组合是不同的。
     对于给定的输入，保证和为 target 的不同组合数少于 150 个。
     */
    
//    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
//        
//    }
    
    func merge2(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 0 else { return [] }
        
        var intervals = intervals.sorted { $0[0] < $1[0] }
        var result: [[Int]] = .init()
        
        for interval in intervals {
            if let last = result.last, last[1] >= interval[0] {
                result.removeLast()
                result.append([last[0], max(last[1], interval[1])])
            } else {
                result.append(interval)
            }
        }
        
        return result
    }
    
    class LRUCache {
        class DoubleNode {
            var key: Int
            var value: Int
            var prev: DoubleNode?
            var next: DoubleNode?
            
            init(_ key: Int, _ value: Int) {
                self.key = key
                self.value = value
            }
        }
        
        var cache: [Int: DoubleNode] = .init()
        let max: Int
        var head: DoubleNode
        var tail: DoubleNode
        
        init(_ max: Int) {
            self.max = max
            self.head = .init(0, 0)
            self.tail = .init(0, 0)
            head.next = tail
            tail.prev = head
        }
        
        func get(_ key: Int) -> Int {
            guard let node = self.cache[key] else {
                return -1
            }
            moveToHead(node)
            return node.value
        }
        
        func put(_ key: Int, _ value: Int) {
            if let node = self.cache[key] {
                node.value = value
                moveToHead(node)
                return
            }
            
            let newNode = DoubleNode(key, value)
            cache[key] = newNode
            addToHead(newNode)
            
            if cache.count > max {
                if let tail = removeTail() {
                    cache.removeValue(forKey: tail.key)
                }
            }
        }
        
        func addToHead(_ node: DoubleNode) {
            node.prev = head
            node.next = head.next
            head.next?.prev = node
            head.next = node
        }
        
        func removeNode(_ node: DoubleNode) {
            node.prev?.next = node.next
            node.next?.prev = node.prev
        }
        
        func moveToHead(_ node: DoubleNode) {
            removeNode(node)
            addToHead(node)
        }
        
        func removeTail() -> DoubleNode? {
            guard let tailNode = tail.prev, tailNode !== head else { return nil }
            removeNode(tailNode)
            return tailNode
        }
    }
    
    func Find2 ( _ target: Int,  _ array: [[Int]]) -> Bool {
        guard array.count > 0, array[0].count > 0 else { return false }
        
        var x = 0
        var y = array.count - 1
        
        while x < array[0].count && y >= 0 {
            if array[y][x] == target {
                return true
            } else if array[y][x] < target {
                x += 1
            } else if array[y][x] > target {
                y -= 1
            }
        }
        
        return false
    }
    
    class LRUCache2 {
        class DoubleNode {
            var key: Int
            var value: Int
            var prev: DoubleNode?
            var next: DoubleNode?
            
            init(_ key: Int, _ value: Int) {
                self.key = key
                self.value = value
            }
        }
        
        var map: [Int: DoubleNode] = .init()
        let max: Int
        var head: DoubleNode = .init(0, 0)
        var tail: DoubleNode = .init(0, 0)
        
        init(_ count: Int) {
            self.max = count
            self.head.next = tail
            self.tail.prev = head
        }
        
        
        func get(_ key: Int) -> Int {
            guard let node = self.map[key] else { return -1 }
            
            moveToHead(node)
            return node.value
        }
        
        func put(_ key: Int, _ value: Int) {
            if let node = self.map[key] {
                moveToHead(node)
                node.value = value
                return
            }
            
            let newNode = DoubleNode(key, value)
            self.map[key] = newNode
            addToHead(newNode)
            
            if map.count > max {
                if let tailNode = removeTail() {
                    self.map.removeValue(forKey: tailNode.key)
                }
            }
        }
        
        func moveToHead(_ node: DoubleNode) {
            removeNode(node)
            addToHead(node)
        }
        
        func addToHead(_ node: DoubleNode) {
            node.prev = head
            node.next = head.next
            head.next = node
            head.next?.prev = node
        }
        
        func removeNode(_ node: DoubleNode) {
            node.prev?.next = node.next
            node.next?.prev = node.prev
        }
        
        func removeTail() -> DoubleNode? {
            guard let tailNode = tail.prev, tailNode !== head else {
                return nil
            }
            
            removeNode(tailNode)
            return tailNode
        }
    }
}
