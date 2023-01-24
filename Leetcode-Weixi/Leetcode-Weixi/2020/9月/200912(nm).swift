//
//  200912.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/11/4.
//

import Foundation

class Solution200912 {
    func averageOfLevels(_ root: TreeNode?) -> [Double] {
        guard let root = root else { return []}
        
        var result: [Double] = [Double]()
        var queue: [TreeNode] = [root]
        
        while !queue.isEmpty{
            let count = queue.count
            var levelSum = 0
            
            for _ in 0 ..< count{
                let node = queue.removeFirst()
                levelSum += node.val
                if let left = node.left { queue.append(left) }
                if let right = node.right { queue.append(right) }
            }
            result.append(Double(levelSum) / Double(count))
        }
        
        return result
    }
}
