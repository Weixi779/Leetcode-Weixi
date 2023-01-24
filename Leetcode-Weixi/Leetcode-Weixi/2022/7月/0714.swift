//
//  0714.swift
//  2022Leetcode
//
//  Created by yunzhanghu1186 on 2022/7/14.
//

import Foundation

// - 题目: 208. 实现 Trie (前缀树)
// - 地址: https://leetcode.cn/problems/implement-trie-prefix-tree/

class TrieNode {
    var isEnd = false
    var children = [TrieNode?](repeating: nil, count: 26)
}

class Trie {
    let root = TrieNode()
    
    func insert(_ word: String) {
        var current = root
        for char in word {
            let index = char.letterIndex
            current = current.children[index] ?? TrieNode()
        }
        current.isEnd = true
    }
    
    func search(_ word: String) -> Bool {
        var current = root
        for char in word {
            let index = char.letterIndex
            guard let subNode = current.children[index] else { return false }
            current = subNode
        }
        return current.isEnd
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var current = root
        for char in prefix {
            let index = char.letterIndex
            guard let subNode = current.children[index] else { return false }
            current = subNode
        }
        return true
    }
}

extension Character {
    var letterIndex: Int { Int(self.asciiValue ?? 96) - 97 }
}
