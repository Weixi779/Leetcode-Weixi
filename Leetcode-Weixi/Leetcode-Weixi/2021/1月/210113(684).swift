//
//  210113.swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/1/13.
//

import Foundation

//[[1,2],[2,3],[1,5],[3,4],[1,4]]
class Solution210113 {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        let nodesCount = edges.count
        var parent = [Int]()
        
        for i in 0...nodesCount+1{
            parent.append(i)
        }
        
        func find(_ index:Int) -> Int {
            if parent[index] != index{
                parent[index] = find(parent[index])
            }
            return parent[index]
        }
        
        func union(_ index1:Int,_ index2:Int){
            parent[find(index1)] = find(index2)
        }
        
        for node in edges{
            if find(node[0]) != find(node[1]){
                union(node[0], node[1])
            }else{
                return [node[0],node[1]]
            }
        }
        return []
    }
}

