//
//  main.swift
//  Leetcode-Weixi
//
//  Created by 孙世伟 on 2023/1/24.
//

import Foundation

//let test = LeetCode2023.February.Solution230201()
//print(test.decodeMessage("the quick brown fox jumps over the lazy dog", "vkbs bs t suepuv"))
let node1 = TreeNode(-1)
let node2 = TreeNode(-1)
let node3 = TreeNode(-1, node1, node2)
let node4 = TreeNode(-1)
let node5 = TreeNode(-1, node3, node4)
let test = LeetCode2024.March.Solution240312.FindElements(node5)
print(test.preorderTraversal(node5))
print(test.find(1))
print(test.find(3))
print(test.find(5))
