//
//  200930.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/11/4.
//

import Foundation
class Solution200930 {
    func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let node = root else {
            let Node = TreeNode(val)
            return Node
        }
        if val > node.val {
            node.right = insertIntoBST(node.right,val)
        }else{
            node.left = insertIntoBST(node.left,val)
        }
        return node
        
    }

}
