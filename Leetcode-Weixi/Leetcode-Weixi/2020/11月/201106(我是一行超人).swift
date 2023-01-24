//
//  201106.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/11/6.
//

import Foundation

class Solution201106 {
    func sortByBits(_ arr: [Int]) -> [Int] {
        return arr.sorted(){if($0.nonzeroBitCount == $1.nonzeroBitCount){return $0<$1}; return $0.nonzeroBitCount < $1.nonzeroBitCount}
    }
}

