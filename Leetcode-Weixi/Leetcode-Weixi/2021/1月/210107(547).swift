//
//  210107(547).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/1/7.
//

import Foundation

class Solution210107 {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        var result = 0
        var graph =  [Int:[Int]]()
        
        for Island_index in 0..<isConnected.count{
            var temp_graph = [Int]()
            for index in 0..<isConnected[Island_index].count{
                if index != Island_index && isConnected[Island_index][index] == 1 {
                    temp_graph.append(index)
                }
            }
            graph.updateValue(temp_graph, forKey: Island_index)
        }
        
        var visited = Set<Int>()
        
        for Island_index in 0..<isConnected.count{
            var queue = [Int]()
            
            if !visited.contains(Island_index) {
                visited.insert(Island_index)
                queue = graph[Island_index]!
                while !queue.isEmpty {
                    let island = queue.removeFirst()
                    if !visited.contains(island){
                        visited.insert(island)
                        for next_island in graph[island]!{
                            if !visited.contains(next_island) {
                                queue.append(next_island)
                            }
                        }
                    }
                }
                result += 1
            }
        }
        return result
    }
}
