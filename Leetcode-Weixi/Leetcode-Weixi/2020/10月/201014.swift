//
//  201014.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/10/14.
//

import Foundation


class Solution201014 {
    func commonChars(_ A: [String]) -> [String] {
        var sortA = A
         sortA.sort(by: { $0.count < $1.count})
         
         var results: [String] = []
         var map: [String : Int] = [:]
         
         for str in sortA.first! {
             if let count = map[String(str)] {
                 map[String(str)]! = count + 1
             } else {
                 map[String(str)] = 1
             }
         }
         
         sortA.removeFirst()
        for (index, str) in sortA.enumerated() {
             var innerMap: [String: Int] = [:]
             for c in str {
                 if let count = map[String(c)], count > 0 {
                     innerMap[String(c)] = (innerMap[String(c)] ?? 0) + 1
                     map[String(c)] = count - 1
                     if index == sortA.count-1 {
                         results.append(String(c))
                     }
                 }
             }
             map = innerMap
         }
         return results
     }
}
