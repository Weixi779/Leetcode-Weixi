//
//  0713.swift
//  2022Leetcode
//
//  Created by yunzhanghu1186 on 2022/7/13.
//

import Foundation

// - 题目: 735. 行星碰撞
// - 地址: https://leetcode.cn/problems/asteroid-collision/

class Solution0713 {
    var stack = [Int]()
    
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        for asteroid in asteroids {
            ConditionCheck(asteroid)
        }
        return stack
    }
    
    private func ConditionCheck(_ target: Int) {
        if target < 0 , let last = stack.last , last > 0 {
            CollisionCheck(last, target)
            return
        }
        stack.append(target)
    }
    
    
    private func CollisionCheck(_ last: Int, _ target: Int) {
        let sum = last + target
        if sum > 0 {
            return
        } else if sum == 0 {
            stack.removeLast()
            return
        } else if sum < 0 {
            stack.removeLast()
            ConditionCheck(target)
        }
    }
    
}
