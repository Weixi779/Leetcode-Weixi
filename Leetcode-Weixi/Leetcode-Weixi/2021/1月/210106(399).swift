//
//  210106(399).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/1/6.
//

import Foundation

class Solution210106 {
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var result = [Double]()
        var map = [ String : [(String,Double)] ]()
        for i in 0..<equations.count{
            let equ = equations[i]
            map[equ[0], default: []].append((equ[1],values[i]))
            map[equ[1], default: []].append((equ[0],1/values[i]))
        }
        for (value,key) in map{
            print("\(value) : \(key)")
        }
        print(queries)
        for qr in queries{
            var found = false
            var visited = Set<String>()
            var queue = [(String,Double)]()
            queue.append(( qr[0] , 1 ))
            while !queue.isEmpty {
                let n = queue.removeFirst()
                visited.insert(n.0)
                if let nbs = map[n.0] {
                    for nb in nbs{
                        if nb.0 == qr[1]{
                            result.append(n.1 * nb.1)
                            queue = [(String,Double)]()
                            found = true
                            break
                        } else {
                            if !visited.contains(nb.0) {
                                queue.append((nb.0 , n.1 * nb.1))
                            }
                        }
                    }
                }
            }
            if !found {
                result.append(-1.0)
            }
        }
        return result
    }
}
