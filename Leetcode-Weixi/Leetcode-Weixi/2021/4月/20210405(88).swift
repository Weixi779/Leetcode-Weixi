//
//  20210405(88).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/4/5.
//

import Foundation

class Solution0405 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var m = m
        nums2.forEach { nums1[m] = $0 ; m += 1  }
        nums1.sort()
    }
}

class SnapshotArray {
    
    var array: [Int]
    var snap_count = -1
    var snap_array = [[Int]]()
    
    init(_ length: Int) {
        array = [Int](repeating: 0, count: length)
    }
    
    func set(_ index: Int, _ val: Int) {
        array[index] = val
    }
    
    func snap() -> Int {
        snap_count += 1
        snap_array.append(array)
        return snap_count
    }
    
    func get(_ index: Int, _ snap_id: Int) -> Int {
        return snap_array[snap_id][index]
    }
}
var test123 = [111,11]
