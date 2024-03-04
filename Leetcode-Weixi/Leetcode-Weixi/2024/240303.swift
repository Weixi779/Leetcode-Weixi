//
//  240303.swift
//  Leetcode-Weixi
//
//  Created by 孙世伟 on 2024/3/3.
//

import Foundation

// - 题目: 225. 用队列实现栈
// - 地址: https://leetcode.cn/problems/implement-stack-using-queues

extension LeetCode2024.March {
    class Queue {
        private var array = [Int]()
        
        public func push(_ x: Int) {
            self.array.append(x)
        }
        
        public func pop() -> Int {
            return self.array.isEmpty ? -1 : self.array.removeFirst()
        }
        
        public func peek() -> Int {
            return self.array.first ?? -1
        }
        
        public func empty() -> Bool {
            return self.array.isEmpty
        }
    }
    
    // - MARK: 双队列版本
//    class MyStack {
//        var storeQueue: Queue
//        var pushQueue: Queue
//
//        init() {
//            self.storeQueue = Queue()
//            self.pushQueue = Queue()
//        }
//        
//        func push(_ x: Int) {
//            self.pushQueue.push(x)
//            while !self.storeQueue.empty() {
//                let next = self.storeQueue.pop()
//                self.pushQueue.push(next)
//            }
//            swap(&self.storeQueue, &self.pushQueue)
//        }
//        
//        func pop() -> Int {
//            return self.storeQueue.pop()
//        }
//        
//        func top() -> Int {
//            return self.storeQueue.peek()
//        }
//        
//        func empty() -> Bool {
//            return self.storeQueue.empty()
//        }
//    }
    class MyStack {
        var storeQueue: Queue
        
        init() {
            self.storeQueue = Queue()
        }
        
        func push(_ x: Int) {
            var pushArray = [Int]()
            pushArray.append(x)
            while !self.storeQueue.empty() {
                let next = self.storeQueue.pop()
                pushArray.append(next)
            }
            self.storeQueue = Queue()
            pushArray.forEach{ self.storeQueue.push($0) }
        }
        
        func pop() -> Int {
            return self.storeQueue.pop()
        }
        
        func top() -> Int {
            return self.storeQueue.peek()
        }
        
        func empty() -> Bool {
            return self.storeQueue.empty()
        }
    }
}
