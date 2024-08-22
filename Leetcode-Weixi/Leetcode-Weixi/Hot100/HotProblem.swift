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
        var dummy: ListNode? = ListNode(-1, head)
        var current = head
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
