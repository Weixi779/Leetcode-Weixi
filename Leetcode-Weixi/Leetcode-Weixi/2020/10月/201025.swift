//
//  201025.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/10/25.
//

import Foundation

//[2,1,4,7,3,2,5]
class Solution201025 {
    func longestMountain(_ A: [Int]) -> Int {
        var Indexs = [Int]()
        var Index = 0
        var Max = 0
        var LastMax = -1
        while Indexs.count != A.count {
            for index in A.indices {
                if A[index] > Max  {
                    if LastMax == -1{
                        Index = index
                        Max = A[index]
                    }
                    if LastMax != -1 && A[index] < LastMax {
                        Index = index
                        Max = A[index]
                    }
                }
            }
            LastMax = Max
            Max = 0
            Indexs.append(Index)
        }
        print(Indexs)
        return 0
    }
}

