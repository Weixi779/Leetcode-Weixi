//
//  2020:10:8.swift
//  sb
//
//  Created by 孙世伟 on 2020/10/8.
//  Copyright © 2020 me.Weixi. All rights reserved.
//

import Foundation

//示例 1：
//输入：["h","e","l","l","o"]
//输出：["o","l","l","e","h"]
//示例 2：
//输入：["H","a","n","n","a","h"]
//输出：["h","a","n","n","a","H"]

func reverseString(_ s: inout [Character]) {
    var head:Int = 0
    var tail:Int = (s.count-1)
    while (head < tail) {
        s.swapAt(head, tail)
        head += 1
        tail -= 1
    }
}
