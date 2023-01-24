//
//  20210314(706).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/3/14.
//

import Foundation

class MyHashMap {
    var hashMap = [Int]( repeating:-1 , count:1000001 )
    /** Initialize your data structure here. */
    init() {

    }
    
    /** value will always be non-negative. */
    func put(_ key: Int, _ value: Int) {
        hashMap[key] = value
    }
    
    /** Returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key */
    func get(_ key: Int) -> Int {
        return hashMap[key]
    }
    
    /** Removes the mapping of the specified value key if this map contains a mapping for the key */
    func remove(_ key: Int) {
        hashMap[key] = -1
    }
}
