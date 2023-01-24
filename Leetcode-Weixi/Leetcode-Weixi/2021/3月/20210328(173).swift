//
//  20210328(173).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/3/28.
//

import Foundation

class BSTIterator {
    
    var stack = [TreeNode]()

    init(_ root: TreeNode?) {
        guard let root = root else { return }
        preload(root)
    }
    
    func preload(_ node: TreeNode?) {
        var current: TreeNode? = node
        while current != nil {
            stack.append(current!)
            current = current!.left
        }
    }
    
    func next() -> Int {
        let smallest = stack.popLast()!
        if let node = smallest.right {
            preload(node)
        }
        return smallest.val
    }
    
    func hasNext() -> Bool {
        return stack.isEmpty
    }
}
