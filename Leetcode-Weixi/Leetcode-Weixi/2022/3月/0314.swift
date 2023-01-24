//
//  0314.swift
//  2022Leetcode
//
//  Created by yunzhanghu1186 on 2022/3/16.
//

import Foundation

class Solution0314 {
    func findRestaurant(_ list1: [String], _ list2: [String]) -> [String] {
        var map = [String:Int]()
        for (index, value) in list1.enumerated() {
            map[value] = index
        }
        var res = [Int:[String]]()
        for (index, value) in list2.enumerated() {
            if let lastIndex = map[value] {
                let index = index+lastIndex
                res[index] = (res[index] ?? []) + [value]
            }
        }
        let minIndex: Int? = res.keys.min()
        if let minIndex = minIndex {
            return res[minIndex]!
        }
        return []
    }
}
