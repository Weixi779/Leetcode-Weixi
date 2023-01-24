//
//  20210403(1143).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/4/3.
//

import Foundation

class Solution20210403 {
    func longestCommonSubsequence( _ text1: String , _ text2: String) -> Int {
        let arr1 = Array(text1)
        let arr2 = Array(text2)
        
        var dp = Array(repeating: Array(repeating: 0, count: text1.count + 1), count: text2.count + 1)
        for i in 1..<dp.count {
            for j in 1..<dp.first!.count{
                if arr1[j-1] == arr2[i-1] {
                    dp[i][j] = 1 + dp[i-1][j-1]
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        return dp[text2.count][text1.count]
    }
}
