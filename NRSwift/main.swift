//
//  main.swift
//  NRSwift
//
//  Created by Nicholas Rogers on 4/18/16.
//  Copyright © 2016 Nicholas Rogers. All rights reserved.
//

import Foundation

var postfix = "8 2 / 3 5 + +"

print(evaluatePostfixDouble(postfix))

func solvePuzzle(startWord w1 : String, endWord w2 : String) -> [String]
{
    let words = try! String(contentsOfFile: "/Users/nicholasrogers/Desktop/dictionary.txt")
    let wordsArray = words.components(separatedBy: "\n")
    
    var g = NRGraph()
    var w1Index = 0
    var w2Index = 0
    
    func wordDeviation(_ w1 : String, w2 : String) -> Int
    {
        var deviation = 0
        for i in 0..<w1.characters.count
        {
            if !w1.isEmpty && !w2.isEmpty
            {
                if w1[w1.characters.index(w1.startIndex, offsetBy: i)] != w2[w2.characters.index(w2.startIndex, offsetBy: i)]
                {
                    deviation += 1
                }
            }
        }
        return deviation
    }
    
    for _ in 0..<wordsArray.count
    {
        g.addVertex()
    }
    
    for i in 0..<wordsArray.count
    {
        if w1 == wordsArray[i]
        {
            w1Index = i
        }
        if w2 == wordsArray[i]
        {
            w2Index == i
        }
        
        print(wordsArray[i])
        
        for k in 0..<wordsArray.count
        {
            if i != k && !wordsArray[i].isEmpty
            {
                if wordDeviation(wordsArray[i], w2: wordsArray[k]) == 1
                {
                    g.addEdge(i, b: k)
                }
            }
        }
    }
    
    var result = [String]()
    let indices = g.shortestPath(w1Index, destination: w2Index)
    
    for index in indices
    {
        result.append(wordsArray[index])
    }
    
    return result
}

//let solution = solvePuzzle(startWord: "black", endWord: "white")
//for item in solution
//{
//    print(item)
//}

func linkedListTest()
{
    let list = NRLinkedList()
    
    let n1 = NRLinkedListNode()
    n1.text = "Nick"
    let n2 = NRLinkedListNode()
    n2.text = "Rogers"
    let n3 = NRLinkedListNode()
    n3.text = "human"
    
    list.add(toEnd: n1)
    list.add(toEnd: n2)
    list.add(toEnd: n3)
    
    iterate(list)
}

linkedListTest()
