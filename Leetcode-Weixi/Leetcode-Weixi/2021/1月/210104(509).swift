//
//  210104(509).swift
//  2021Leetcode
//
//  Created by 孙世伟 on 2021/1/7.
//

import Foundation

class Solution210104 {
    func fib(_ n: Int) -> Int {
        guard n != 0 else { return 0}
        var fib = [0,1]
        for _ in 1..<n{
            fib.append(fib[0]+fib[1])
            fib.removeFirst()
        }
        return fib.last!
    }
}
//这是最经典的写法,但是效率太低了
//func fib(_ n: Int) -> Int {
//    if n == 0 || n == 1{
//        return n
//    }else{
//        return fib(n-1) + fib(n-2)
//    }
//}
