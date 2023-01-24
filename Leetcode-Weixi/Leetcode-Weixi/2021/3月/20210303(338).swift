//
//  20210303(338).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/3/3.
//

import Foundation

class Solution20210303 {
    func countBits(_ num: Int) -> [Int] {
        var result = [0]
        var bits = [0]
        for _ in 0..<num{
            result.append(addOne(&bits))
        }
        return result
    }
    func addOne(_ bits:inout [Int]) -> Int{
        if !bits.contains(0) {
            bits = [Int](repeating: 0, count: bits.count)
            bits.append(1)
        }else{
            bits[0] += 1
            for index in 0..<bits.count{
                if bits[index] == 2 {
                    bits[index] = 0
                    bits[index+1] += 1
                }
            }
        }
        print(bits)
        let result = bits.filter(){ $0 == 1 }
        return result.count
    }
}
