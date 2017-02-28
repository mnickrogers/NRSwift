//
//  NRStack.swift
//  NRSwift
//
//  Created by Nicholas Rogers on 2/27/17.
//  Copyright © 2017 Nicholas Rogers. All rights reserved.
//

import Foundation

public struct NRStack<T>
{
    private var items = [T]()
    
    mutating func push(_ item : T)
    {
        items.append(item)
    }
    
    mutating func pop() -> T
    {
        return items.removeLast()
    }
    
    func empty() -> Bool { return !Bool(items.count) }
    func size() -> Int { return items.count }
}
