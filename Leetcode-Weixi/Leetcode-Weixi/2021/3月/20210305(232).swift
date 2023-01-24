//
//  20210305(232).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/3/13.
//

import Foundation

class MyQueue {
    var Stack1 = [Int]()
    var Stack2 = [Int]()
    /** Initialize your data structure here. */
    init() {

    }
    
    /** Push element x to the back of queue. */
    func push(_ x: Int) {
        Stack1.append(x)
    }
    
    /** Removes the element from in front of queue and returns that element. */
    func pop() -> Int {
        if Stack2.isEmpty {
            while !Stack1.isEmpty {
                Stack2.append(Stack1.popLast()!)
            }
        }
        return Stack2.popLast()!
    }
    
    /** Get the front element. */
    func peek() -> Int {
        if Stack2.isEmpty {
            while !Stack1.isEmpty {
                Stack2.append(Stack1.popLast()!)
            }
        }
        return Stack2.last!
    }
    
    /** Returns whether the queue is empty. */
    func empty() -> Bool {
        return Stack1.isEmpty && Stack2.isEmpty
    }
}

