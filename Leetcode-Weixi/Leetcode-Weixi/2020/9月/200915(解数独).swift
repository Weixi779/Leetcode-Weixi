//
//  200915(解数独).swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/11/4.
//

import Foundation

class Solution200915 {
    
    var character: [[Character]] = [["5","9","3","8","7",".",".","2","."],
                                    [".",".",".","5",".","3",".",".","."],
                                    ["6","8",".","9","2",".","5",".","4"],
                                    ["7","2","5",".",".",".",".","1","3"],
                                    ["8","6",".","1","3","5","2","7","9"],
                                    [".","3",".",".","8",".",".","6","5"],
                                    [".","7",".",".",".",".",".",".","."],
                                    [".",".","2","7",".","9",".","4","."],
                                    ["4","1","6",".","5",".",".",".","2"]]

    let choiceCharacter: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        
        //  把每行每列每个格子已经填充的数保存起来
        var rows = Array.init(repeating: Array(repeating: 0, count: 10), count: 9)
        var cols = Array.init(repeating: Array(repeating: 0, count: 10), count: 9)
        var grides = Array.init(repeating: Array(repeating: 0, count: 10), count: 9)
        var spaces = [(Int, Int)]()     // 收集所有没有数字的点
        
        func solveSudoku(_ board: inout [[Character]]) {
            
            //  数据预处理
            for i in 0..<9 {
                for j in 0..<9 {
                    let c = board[i][j]
                    if c == "." {
                        spaces.append((i, j))
                    } else {
                        let intC = Int(String(c))!
                        rows[i][intC] = 1
                        cols[j][intC] = 1
                        grides[i / 3 * 3 + j / 3][intC] = 1
                    }
                }
            }

            backtrack2(&board, index: 0)
        }
        
        @discardableResult
        func backtrack2(_ board: inout [[Character]], index: Int) -> Bool {
            guard index < spaces.count else {
                return true
            }// 异常处理
            
            let (i , j) = spaces[index]
            let grid = i / 3 * 3 + j / 3
            for choice in 1...9 {
                //  填充的数已经存在
                if rows[i][choice] == 1 || cols[j][choice] == 1  || grides[grid][choice] == 1  {
                    continue
                }
                board[i][j] = choiceCharacter[choice]
                rows[i][choice] = 1
                cols[j][choice] = 1
                grides[i / 3 * 3 + j / 3][choice] = 1
                
                if (backtrack2(&board, index: index + 1)) {
                    return true
                }
                
                board[i][j] = "."
                rows[i][choice] = 0
                cols[j][choice] = 0
                grides[i / 3 * 3 + j / 3][choice] = 0
            }
            return false
        }
    func printSudoku(_ character: [[Character]]){
        
        for i in character.indices{
            print("|",  terminator: "")
            for j in 0..<character[i].count {
                print("\(character[i][j])" + "|",  terminator: "" )
            }
            print()
        }
        print()
    }
    func printRandC(_ character: [[Int]]){
        for i in character.indices{
            print("\(character[i])")
        }
        print()
    }
    //solveSudoku(&character)
    //printSudoku(character)

    //var result: Int = 1
    //func thisNameisjiecheng(_ number: Int){
    //    jiecheng(number)
    //    print(result)
    //}
    //@discardableResult  // 我感觉这样写其实更漂亮
    //func jiecheng(_ number: Int)-> Bool{
    //    guard number > 0 else {
    //        return true
    //    }
    //    result *= number
    //    if jiecheng(number - 1){
    //        return true
    //    }
    //    return false
    //}
}

