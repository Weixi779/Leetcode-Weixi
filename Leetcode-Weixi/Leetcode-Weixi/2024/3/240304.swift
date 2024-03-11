//
//  240304.swift
//  Leetcode-Weixi
//
//  Created by yunzhanghu1186 on 2024/3/4.
//

import Foundation

// - 题目: 232. 用栈实现队列
// - 地址: https://leetcode.cn/problems/implement-queue-using-stacks

extension LeetCode2024.March {
    class Stack {
        private var array: [Int]
        
        init() {
            self.array = []
        }
        
        func push(_ x: Int) {
            self.array.append(x)
        }
        
        func pop() -> Int {
            return self.array.isEmpty ? -1 : self.array.removeLast()
        }
        
        func top() -> Int {
            return self.array.last ?? -1
        }
        
        func empty() -> Bool {
            return self.array.isEmpty
        }
    }
    
    class MyQueue {
        
        private var storeStack = Stack()
        
        init() {
            
        }
        
        func push(_ x: Int) {
            let tempStack = Stack()
            while !self.storeStack.empty() {
                tempStack.push(tempStack.pop())
            }
            tempStack.push(x)
            while !tempStack.empty() {
                self.storeStack.push(tempStack.pop())
            }
        }
        
        func pop() -> Int {
            return self.storeStack.pop()
        }
        
        func peek() -> Int {
            return self.storeStack.top()
        }
        
        func empty() -> Bool {
            return self.storeStack.empty()
        }
    }
}
