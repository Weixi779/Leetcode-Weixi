//
//  210118.swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/1/18.
//

import Foundation
class UnionFind {
    private var parents: [Int]
    
    init(_ size: Int) {
        parents = Array<Int>(0..<size)
    }
    
    func union(x: Int, y: Int) {
        let rootX = find(node: x)
        let rootY = find(node: y)
        parents[rootX] = rootY
    }
    
    func find(node: Int) -> Int {
        if node != parents[node] {
            parents[node] = find(node: parents[node])
        }
        
        return parents[node]
    }
}

class Solution210118 {
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var randomName = [Bool:String]()
        randomName.updateValue("顺序", forKey: false)
        randomName.updateValue("随机", forKey: true)
        print(randomName)
        return [[]]
    }
}
