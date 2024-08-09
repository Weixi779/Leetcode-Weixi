//
//  Node.swift
//  Leetcode-Weixi
//
//  Created by 孙世伟 on 2024/8/8.
//

import Foundation

public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}
