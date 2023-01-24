//
//  20210304(354).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/3/4.
//

import Foundation

class Solution20210304 {
    func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
        guard envelopes.count > 1 else { return envelopes.count }
        var envelope = envelopes
        envelope.sort(){ (s1,s2) -> Bool in
            if s1.first ?? 0 == s2.first ?? 0{
                return s1.last! > s2.last!
            }else{
                return s1.first! < s2.first!
            }
        }
        var dp = [Int](repeating: 1, count: envelope.count)
        for (index,_) in envelope.enumerated(){
            for j in 0..<index{
                if envelope[index][1] > envelope[j][1]{
                    dp[index] = max(dp[index], dp[j]+1)
                }
            }
        }
        return dp.max()!
    }
}
