//
//  201104.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/11/4.
//

import Foundation

class Solution201104 { // 我改了改大佬的
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var intervals = intervals

        var result = [[Int]]()

        // 排序
        intervals.append(newInterval)
        intervals = intervals.sorted(by: {$0[0]<$1[0]})
        // 合并
        for i in 0..<intervals.count {

                if result.count == 0 || intervals[i][0] > result[result.count - 1][1] {
                    result.append(intervals[i])
                } else {
                    result[result.count - 1] = [result[result.count - 1][0], max(result[result.count - 1][1], intervals[i][1])]
                }
            }
        
        return result

    }
    func insert2(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] { // by myself
        var result = [[Int]]()
        var temp = intervals
        temp.append(newInterval)
        temp = temp.sorted(){ $0[0] < $1[0] }
        for i in temp.indices {
            if result.count == 0 || temp[i][0] > result[result.count-1][1] {
                result.append(temp[i])
            } else {
                result[result.count-1] = [  result[result.count-1][0] ,
                                            max(result[result.count-1][1],temp[i][1])]
            }
        }
        return result
    }
}

