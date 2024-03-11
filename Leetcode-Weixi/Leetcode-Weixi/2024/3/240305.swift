//
//  240305.swift
//  Leetcode-Weixi
//
//  Created by 孙世伟 on 2024/3/5.
//

import Foundation

// - 题目: 1976. 到达目的地的方案数
// - 地址: https://leetcode.cn/problems/number-of-ways-to-arrive-at-destination/description/

extension LeetCode2024.March {
    class Solution240305 {
        func countPaths(_ n: Int, _ roads: [[Int]]) -> Int {
            let mod = 1_000_000_007
            var graph = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n)
            
            roads.forEach { road in
                let start = road[0]
                let end = road[1]
                let distance = road[2]
                graph[start][end] = distance
                graph[end][start] = distance
            }
            
            var visited = [Bool](repeating: false, count: n)
            var distances = [Int](repeating: Int.max, count: n)
            var count = [Int](repeating: 0, count: n)
            
            distances[0] = 0
            count[0] = 1
            
            for _ in 0..<n {
                var minEdgeVertex = -1
                for vertex in 0..<n {
                    let isNotVisited = !visited[vertex]
                    let isMinEdgeVertex = minEdgeVertex == -1
                    let isLargerDistance = distances[minEdgeVertex] > distances[vertex]
                    if isNotVisited && (isMinEdgeVertex || isLargerDistance) {
                        minEdgeVertex = vertex
                    }
                }
                
                visited[minEdgeVertex] = true
                for vertex in 0..<n {
                    if graph[minEdgeVertex][vertex] == Int.max {
                        continue
                    }
                    if visited[vertex] {
                       continue
                    }
                    let possibleMinDis = distances[minEdgeVertex] + graph[minEdgeVertex][vertex]
                    if distances[vertex] > possibleMinDis {
                        distances[vertex] = possibleMinDis
                        count[vertex] = count[minEdgeVertex]
                    } else if distances[vertex] == possibleMinDis {
                        count[vertex] = (count[vertex] + count[minEdgeVertex]) % mod
                    }
                }
            }
            return count[n - 1]
        }
    }
}
