//
//  210113-2(56).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/1/13.
//

import Foundation

class Solution56 {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let intervals = intervals.sorted{ $0[0] < $1[0]}
        var result = [[Int]]()
        
        for i in intervals{
            if !result.isEmpty,i[0]<=result.last![1]&&i[0]>=result.last![0]{
                let temp = (result.last!+i).sorted{ $0 < $1 }
                result[result.count-1] = [temp.first!,temp.last!]
            }else{
                result.append(i)
            }
        }
        return result
    }
}
