//
//  200919.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/11/4.
//

import Foundation

class Solution200919 {
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var sum = 0
        if let left = root.left , left.left == nil ,left.right == nil {
            sum += left.val
        }
        
        return sum + sumOfLeftLeaves(root.left) + sumOfLeftLeaves(root.right)
    }
}
