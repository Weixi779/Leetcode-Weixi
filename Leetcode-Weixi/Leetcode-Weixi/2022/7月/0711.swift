//
//  0711.swift
//  2022Leetcode
//
//  Created by yunzhanghu1186 on 2022/7/11.
//

import Foundation
class Solution0711 {
    
    var magicDictionary: [Int:[String]]
    
    init() {
        magicDictionary = [Int:[String]]()
    }
    
    func buildDict(_ dictionary: [String]) {
        for string in dictionary {
            let count = string.count
            if let temp = magicDictionary[count] , temp.contains(string) {
                continue
            }
            magicDictionary[count] = (magicDictionary[count] ?? []) + [string]
        }
    }
    
    func search(_ searchWord: String) -> Bool {
        let searchCount = searchWord.count
        guard let searchArray = magicDictionary[searchCount] else {
            return false
        }
        
        for word in searchArray {
            if searchCheck(searchWord, word) { return true }
        }
        return false
    }
    
    func searchCheck(_ compareWord: String, _ inputWord: String) -> Bool {
        let compareWord = [Character](compareWord)
        let inputWord = [Character](inputWord)
        var diffCount = 0
        for index in 0..<compareWord.count {
            if diffCount > 1 { return false }
            if compareWord[index] != inputWord[index] {
                diffCount += 1
            }
        }
        return diffCount == 1
    }
}
