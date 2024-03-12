//
//  201027.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/10/27.
//

import Foundation

class Solution201027 {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }
        return [root.val] + preorderTraversal(root.left) + preorderTraversal(root.right)
    }
}
