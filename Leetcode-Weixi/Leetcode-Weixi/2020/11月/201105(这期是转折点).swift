//
//  201105.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/11/5
//

import Foundation

class Solution201105 {
    let enCode: [Character] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        if !wordList.contains(endWord) { return 0 }
        let graph = crateGraph(beginWord,wordList)
//        for (key,vaule) in graph{
//            print("\(key)" + " : " + "\(vaule)")
//        }
        var visited = Set<String>()
        var queue = [String]()
        var path = [beginWord : "0"]
        visited.insert(beginWord)
        queue.append(beginWord)
        while queue.count > 0 {
            let temp = queue.remove(at: 0)
            let nodes = graph[temp]!
            for i in 0..<nodes.count{
                if !visited.contains(nodes[i]) {
                    queue.append(nodes[i])
                    visited.insert(nodes[i])
                    path.updateValue(temp, forKey: nodes[i])
                }
            }
        }
        var node = endWord
        var paths = [String]()
        while node != "0" {
            paths.append(node)
            node = path[node] ?? "0"
        }
        if paths.contains(beginWord){
            return paths.count
        }
        return 0
    }
    func crateGraph(_ beginWord:String,_ wordList: [String])->[String : [String]]{
        var graph = [String:[String]]()
        var wordList = wordList
        wordList.insert(beginWord, at: 0)
        
        for first in wordList.indices {     //选择便利单词
            var tempWords = [String]()
            let word = Array(wordList[first])
            for second in wordList.indices{     //单词与其他单词便利
               
                if first != second {
                    for third in word.indices{      //替换
                        for fourth in 0..<enCode.count {    //替换
                            var temp = word
                            temp[third] = enCode[fourth]
                            if !tempWords.contains(String(temp)) && temp != word &&  wordList.contains(String(temp)){
                                tempWords.append(String(temp))
                            }
                        }
                    }
                }
            }
            tempWords = Array(tempWords)
            graph.updateValue(tempWords, forKey: wordList[first])
        }
        return graph
    }
}
