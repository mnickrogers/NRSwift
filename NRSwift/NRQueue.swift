//
//  NRQueue.swift
//  NRSwift
//
//  Created by Nicholas Rogers on 2/27/17.
//  Copyright © 2017 Nicholas Rogers. All rights reserved.
//

import Foundation

public struct NRQueue<T>
{
    private var items = [T]()
    
    mutating func pushBack(_ item : T)
    {
        items.insert(item, at: 0)
    }
    
    mutating func popFront() -> T
    {
        return items.removeLast()
    }
    
    func front() -> T?
    {
        if (!empty())
        {
            return items[items.endIndex - 1]
        }
        else
        {
            return nil
        }
    }
    
    func back() -> T?
    {
        if (!empty())
        {
            return items[0]
        }
        else
        {
            return nil
        }
    }
    
    func empty() -> Bool { return !Bool(items.count) }
    func size() -> Int { return items.count }
}
