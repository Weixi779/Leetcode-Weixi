//
//  200929.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/11/4.
//

import Foundation
class Solution200929 {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var result: [Int] = [Int]()
        guard let root = root else { return [] }
        //    result += postorderTraversal(root.right)
        //    result += postorderTraversal(root.left)
        //    result.append(root.val)
        //    return result
        if root.left != nil {
            result += postorderTraversal(root.left)
        }
        if root.right != nil{
            result += postorderTraversal(root.right)
        }
        result.append(root.val)
        return result
    }
}
