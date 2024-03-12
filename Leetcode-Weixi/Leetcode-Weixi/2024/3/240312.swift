//
//  240312.swift
//  Leetcode-Weixi
//
//  Created by 孙世伟 on 2024/3/12.
//

import Foundation

// - 题目: 1261. 在受污染的二叉树中查找元素
// - 地址: https://leetcode.cn/problems/capitalize-the-title

extension LeetCode2024.March {
    class Solution240312 {
        class FindElements {
            var set: Set<Int> = []
            let root: TreeNode?

            init(_ root: TreeNode?) {
                self.root = root
                updateValue(self.root, 0)
            }
            
            private func updateValue(_ node: TreeNode?, _ value: Int) {
                guard let node = node else { return }
                node.val = value
                self.set.insert(value)
                updateValue(node.left, 2 * value + 1)
                updateValue(node.right, 2 * value + 2)
            }
            
            func find(_ target: Int) -> Bool {
                return self.set.contains(target)
            }
        }
    }
}
