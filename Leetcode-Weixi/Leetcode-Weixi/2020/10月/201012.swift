//
//  201012.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/10/12.
//

import Foundation

class Solution201012 {
    
    public class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
        }
    }
    func getMinimumDifference(_ root: TreeNode?) -> Int {
        let nums: [Int] = MiddleOrderIterations(root)
        var Min: Int = nums[1] - nums[0]
        for i in 1..<(nums.count-1) {
            Min = min(Min, nums[i+1] - nums[i])
        }
        return Min
    }
    //-MARK:最最经典的中序遍历
    func MiddleOrderIterations(_ root: TreeNode?) -> [Int]{
        guard let root = root else { return [] }
        return MiddleOrderIterations(root.left) + [root.val] + MiddleOrderIterations(root.right)
    }
}
