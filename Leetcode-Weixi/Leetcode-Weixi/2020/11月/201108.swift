//
//  201108.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/11/8.
//

import Foundation

class Solution201108 {
    func maxProfit(_ prices: [Int]) -> Int {
        var DP = 0
        var min = prices.count > 0 ? prices[0] : 0
        
        for item in prices {
            if item > min {
                let newDP = item - min;
                DP = newDP > DP ? newDP : DP
            }
            if item < min {
                min = item
            }
        }
        return DP

    }
    func maxProfit2(_ prices: [Int]) -> Int{
        var maxProfit = 0
        for i in 0..<prices.count - 1 {
            let curProfit = prices[i + 1] - prices[i]
            if curProfit > 0 {
                maxProfit = maxProfit + curProfit
            }
        }
        return maxProfit
    }
}
