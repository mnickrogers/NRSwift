//
//  NRLinkedList.swift
//  NRSwift
//
//  Created by Nicholas Rogers on 2/26/17.
//  Copyright © 2017 Nicholas Rogers. All rights reserved.
//

import Foundation

///The node for this linked list. Nodes are the building blocks of a linked list. Nodes have heads and tails. Iff a node's head == nil, then it is the first node in the linked list. Iff a node's tail == nil, then it is the last node in the linked list. Subclass NRLinkedListNode for customization.
public class NRLinkedListNode
{
    /// The node before this node.
    public weak var head: NRLinkedListNode?
    
    /// The node after this node.
    public weak var tail: NRLinkedListNode?
    
    public var text: String?
    
    public init()
    {
    }
}

/// A linked list.
public class NRLinkedList
{
    /// The start of this linked list.
    public weak var start: NRLinkedListNode?
    
    /// The end of this linked list.
    public weak var end: NRLinkedListNode?
    
    /// Create an empty linked list.
    public init()
    {
    }
    
    /// Create a linked list from another linked list.
    public init(_ linkedList: NRLinkedList)
    {
        start = linkedList.start
        end = linkedList.end
    }
    
    /// Add a node to the tail of this linked list.
    public func add(toEnd node: NRLinkedListNode)
    {
        node.head = end
        node.tail = nil
        end?.tail = node
        end = node
        
        if start == nil
        {
            start = node
        }
    }
    
    /// Add a node to the head of this linked list.
    public func add(toBeginning node: NRLinkedListNode)
    {
        node.tail = start
        node.head = nil
        start?.head = node
        start = node
    }
    
    /// Insert a node after another node.
    public func insert(node: NRLinkedListNode, after afterNode: NRLinkedListNode)
    {
        node.head = afterNode
        node.tail = afterNode.tail
        afterNode.head = node
        
        if afterNode.tail == nil
        {
            end = node
        }
    }
    
    /// Insert a node before another node.
    public func insert(node: NRLinkedListNode, before beforeNode: NRLinkedListNode)
    {
        node.head = beforeNode.head
        node.tail = beforeNode
        beforeNode.head = node
        
        if beforeNode.head == nil
        {
            start = node
        }
    }
}

public func iterate(_ list: NRLinkedList)
{
    var controlNode: NRLinkedListNode? = list.start
    
    while controlNode != nil
    {
        print(controlNode?.text ?? "")
        controlNode = controlNode?.tail
    }
}
