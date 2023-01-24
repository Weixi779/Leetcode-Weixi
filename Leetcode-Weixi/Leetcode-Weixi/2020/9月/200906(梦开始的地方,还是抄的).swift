//
//  200906.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/11/4.
//

import Foundation


class Solution200906 {
    
      class QuestionII {
        public class TreeNode {
            public var val: Int
            public var left: TreeNode?
            public var right: TreeNode?
            public init(_ val: Int) {
                self.val = val
                self.left = nil
                self.right = nil
            }
        }
        var levels = [[Int]]()
         func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
             if root == nil {
                 return levels
             }
             _helper(root, 0)
             return levels.reversed()
         }

         func _helper(_ t: TreeNode?, _ level: Int) {
             if levels.count == level {
                 levels.append([Int]())
             }

             levels[level].append(t?.val ?? 0)

             if t?.left != nil {
                 _helper(t?.left, level + 1)
             }

             if t?.right != nil {
                 _helper(t?.right, level + 1)
             }
         }

    }
    
    func intToRoman(_ num: Int) -> String {
        
        struct numbers{
            var number: Int
            var symbol: String
        }
        var spMode = false
        var douMode = false
        var result: String = ""
        var numCount: Int = 0
        var numCopy = num
        let Numbers:[numbers] = [   numbers.init(number: 1, symbol: "I"),   //0
                                    numbers.init(number: 5, symbol: "V"),   //1
                                    numbers.init(number: 10, symbol: "X"),  //2
                                    numbers.init(number: 50, symbol: "L"),  //3
                                    numbers.init(number: 100, symbol: "C"), //4
                                    numbers.init(number: 500, symbol: "D"), //5
                                    numbers.init(number: 1000, symbol: "M"),]   //6
        while numCopy > 0 {
            numCopy /= 10
            numCount += 1
        }
        numCopy = num
        while numCount > 0 {
            for i in ((numCount*2-2)...(numCount*2-1)).reversed(){
                if i != 7 && numCopy >= Numbers[i].number {
                    if i >= 1 && i != 6 && i % 2 == 1 && numCopy / Numbers[i-1].number == 9{
                        spMode = true
                    }
                    let n = numCopy / Numbers[i].number
                    for _ in 0..<n {
                        if !douMode{
                            if numCopy / Numbers[i].number == 4  && !spMode{
                                result.append(Numbers[i].symbol)
                                result.append(Numbers[i+1].symbol)
                                break
                            }else if spMode{
                                douMode = true
                                result.append(Numbers[i-1].symbol)
                                result.append(Numbers[i+1].symbol)
                                break
                            }else{
                                result.append(Numbers[i].symbol)
                            }
                        }
                    }
                    
                    numCopy = numCopy % Numbers[i].number
                }
                spMode = false
            }
            douMode = false
            numCount -= 1
        }
        
        return result
    }
}
