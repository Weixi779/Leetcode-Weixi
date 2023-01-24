//
//  201109.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/11/9.
//

import Foundation

class Solution201109 {
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        let points = points.sorted(){ Int(pow(Double($0[0]), 2) + pow(Double($0[1]), 2)) < Int(pow(Double($1[0]), 2) + pow(Double($1[1]), 2))}
        return [[Int]](points[0..<K])
    }
}


//func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
//    var result = [[Int]]()
//    let points = points.sorted(){ _sqrt($0) < _sqrt($1)}
//
//    for i in 0..<K{
//        result.append(points[i])
//    }
//    return result
//}
//func _sqrt(_ points:[Int])->Int{
//    return Int(pow(Double(points[0]), 2) + pow(Double(points[1]), 2))
//}
