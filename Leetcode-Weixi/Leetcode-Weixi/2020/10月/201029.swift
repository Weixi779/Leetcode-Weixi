//
//  201029.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/10/29.
//

import Foundation

//public class TreeNode {
//    public var val: Int
//    public var left: TreeNode?
//    public var right: TreeNode?
//    public init(_ val: Int) {
//        self.val = val
//        self.left = nil
//        self.right = nil
//    }
//}

class Solution201029 {
    func sumNumbers(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        return Dfs(root, 0)
    }
    func Dfs(_ root: TreeNode? , _ vaule : Int) -> Int{
        guard let root = root else { return 0 }
        let tempVaule = vaule * 10 + root.val
        if root.left == nil && root.right == nil {
            return tempVaule
        }
        return Dfs(root.left, tempVaule) + Dfs(root.right, tempVaule)
    }
}
