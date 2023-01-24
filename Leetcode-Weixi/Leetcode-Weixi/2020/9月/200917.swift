//
//  200917.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/11/4.
//

import Foundation

class Solution200917 {
    var sum: Int = 0
    func convertBST(_ root: TreeNode?) -> TreeNode? {
        guard let node = root else { return root }
        convertBST(node.right)
        node.val += sum
        sum = node.val
        convertBST(node.left)
        return node
    }
}
