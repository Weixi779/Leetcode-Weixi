//
//  20210331(90).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/3/31.
//

import Foundation


class Solution20210331 {
    
    var result = [[Int]]()
    var temp = [Int]()
    
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        result.append([])
        DFS(0, nums)
        return result
    }
    
    private func DFS(_ start:Int , _ nums: [Int]) {
        if !result.contains(temp) {
            result.append(temp)
        }
        
        if start == nums.count {
            return
        }
        
        for i in start..<nums.count {
            temp.append(nums[i])
            DFS(i + 1, nums)
            temp.removeLast()
        }
    }
    func characterReplacement(_ s: String, _ k: Int) -> Int {
        let s = Array(s)
        var charArray = [Int](repeating: 0, count: 26)
        var maxCharCount = 0
        var strCount = 0
        var removeIndex = 0

        for char in s {
            strCount += 1
            charArray[Int(char.asciiValue!) - 65] += 1
            if strCount - charArray.max()! > k {
                let tempChar = s[removeIndex]
                charArray[Int(tempChar.asciiValue!) - 65] -= 1
                removeIndex += 1
                strCount -= 1
            }
            if strCount > maxCharCount {
                maxCharCount = strCount
            }
        }
        return maxCharCount
    }
}
