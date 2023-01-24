//
//  20210404(781).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/4/4.
//

import Foundation

class Solution20210404 {
    func numRabbits(_ answers: [Int]) -> Int {
        var result = 0
        var hash = [Int:Int]()
        for answer in answers {
            if !hash.keys.contains(answer) {
                result += 1 + answer
                hash.updateValue(1, forKey: answer)
            } else {
                if answer >= hash[answer]! {
                    hash.updateValue(hash[answer]!+1, forKey: answer)
                } else if answer < hash[answer]!{
                    result += 1 + answer
                    hash.updateValue(1, forKey: answer)
                }
            }
        }
        return result
    }
}
