//
//  200916.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/11/4.
//

import Foundation

class Solution200916 {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
            guard let node = root else { return root }
            let left: TreeNode? = invertTree(node.left)
            let right: TreeNode? = invertTree(node.right)
            node.left = right
            node.right = left
            return node
    }
}
