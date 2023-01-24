//
//  210101.swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/1/2.
//

import Foundation

class Solution0101 {
    func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
        var index = 0
        var count = 0
        while index < flowerbed.count {
            let left = index == 0 ? 0 : flowerbed[index-1]
            let right = index == flowerbed.count-1 ? 0 : flowerbed[index+1]
            if left + flowerbed[index] + right == 0{
                index += 2
                count += 1
            }else{
                if right == 1{
                    index += 3
                }else if flowerbed[index] == 1{
                    index += 2
                }else if left == 1{
                    index += 1
                }
            }
        }
        return count >= n
    }
}
