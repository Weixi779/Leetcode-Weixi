//
//  201028.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/10/28.
//

import Foundation
class Solution201028 {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        let sorted = arr.sorted(){ $0 < $1 }
        var result = [Int]()
        var LastIndex = sorted[0]
        for index in sorted.indices {
            if index == 0 || LastIndex != sorted[index] {
                result.append(1)
            }else{
                result[(result.count-1)] += 1
            }
            LastIndex = sorted[index]
        }
        if Set(result).count == result.count{
            return true
        }else{
            return false
        }
    }
    
    func uniqueOccurrencesV2(_ arr: [Int]) -> Bool {
        var map = [Int: Int]()
        
        for item in arr{
            if map.keys.contains(item){
                map.updateValue(map[item]! + 1 , forKey: item)
            }else{
                map.updateValue(1, forKey: item)
            }
        }
        var list = [Int]()
        for item in map{
            list.append(item.value)
        }
        if list.count == Set(list).count{
            return true
        }else{
            return false
        }
        
    }
}
