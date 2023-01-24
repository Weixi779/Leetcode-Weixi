//
//  0215.swift
//  2022Leetcode
//
//  Created by yunzhanghu1186 on 2022/2/15.
//
import Foundation
/*
 给你一个 m * n 的矩阵，矩阵中的数字 各不相同 。请你按 任意 顺序返回矩阵中的所有幸运数。

 幸运数是指矩阵中满足同时下列两个条件的元素：

 在同一行的所有元素中最小
 在同一列的所有元素中最大

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/lucky-numbers-in-a-matrix
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution0215 {
    func luckyNumbers (_ matrix: [[Int]]) -> [Int] {
        var res = [Int]()
        var maxArr = [Int]()
        for x in 0..<matrix[0].count {
            var temp = [Int]()
            for y in 0..<matrix.count {
                temp.append(matrix[y][x])
            }
            if let max = temp.max() {
                maxArr.append(max)
            }
        }
        for matrix in matrix {
            if let min = matrix.min(), maxArr.contains(min) {
                res.append(min)
            }
        }
        return res
    }
}
