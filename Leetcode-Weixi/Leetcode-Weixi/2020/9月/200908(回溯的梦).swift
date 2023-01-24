//
//  200908.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/11/4.
//

import Foundation

class Solution200908 {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        if k <= 0 || n < k {
            return []
        }
        
        var result = [[Int]]()
        var combineArray = [Int]()
        combineDFS(1, n, k, &combineArray, &result)
        return result
    }
    
    func combineDFS(_ start: Int, _ n: Int, _ k: Int, _ combineArray: inout [Int] , _ result: inout [[Int]]){
        if combineArray.count == k {
            //            print("成功加入:"+"\(combineArray)")
            result.append(combineArray)
            return
        }
        if start > n {
            return
        }
        for index in start ... n {
            combineArray.append(index)
            //            print(index)
            //            print("combineDFS:" + "\(index+1)" + "     " + "DFS数组" + "\(combineArray)")
            combineDFS(index+1, n, k, &combineArray, &result)
            //此步骤很关键：DFS有回头的过程，因此递归之前做了什么，递归之后需要做相同操作的逆向操作
            combineArray.removeLast()
            //            print("after:"+"\(combineArray)")
            
            
        }
    }
}
