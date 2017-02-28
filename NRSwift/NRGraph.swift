//
//  NRGraph.swift
//  NRSwift
//
//  Created by Nicholas Rogers on 2/26/17.
//  Copyright © 2017 Nicholas Rogers. All rights reserved.
//

import Foundation

public class NRGraph
{
    // MARK: Public
    
    /// Returns the number of vertices in this graph.
    public func n() -> Int
    {
        return v.count
    }
    
    /// Returns the number of edges in this graph.
    public func m() -> Int
    {
        var ans = 0
        for list in v
        {
            ans += list.count
        }
        return ans / 2
    }
    
    /// Adds a new vertex to this graph.
    public func addVertex()
    {
        v.append(Set<Int>())
    }
    
    /// Adds edge {a, b} to this graph. Ignores duplicates orderings.
    public func addEdge(_ a : Int, b : Int)
    {
        assert(a < n() && b < n(), "Vertices not in graph.")
        if !isEdge(a, b: b)
        {
            v[a].insert(b)
            v[b].insert(a)
        }
    }
    
    /// Removes a vertex from this graph.
    public func removeVertex(_ a : Int) {}
    
    /// Removes edge {a, b} from this graph.
    public func removeEdge(_ a : Int, b : Int)
    {
        assert(a < n() && b < n())
        if (isEdge(a, b: b))
        {
            v[a].remove(b)
            v[b].remove(a)
        }
    }
    
    /// Returns true iff {a, b} are edges in this graph.
    public func isEdge(_ a : Int, b: Int) -> Bool
    {
        if a >= n() || b >= n()
        {
            return false
        }
        
        if v[a].contains(b)
        {
            return true;
        }
        
        return false
    }
    
    /// Returns the neighbors of vertex a in this graph.
    public func neighbors(_ a : Int) -> Set<Int>
    {
        assert(a < n(), "Vertex not in graph.")
        return v[a]
    }
    
    /// Returns the shortest path from start vertex Source to destination vertex Destination.
    public func shortestPath(_ source : Int, destination : Int) -> [Int]
    {
        var q = NRQueue<Int>()
        var visited = [Bool](repeating: false, count: n())
        var parents = [Int : Int]()
        
        visited[source] = true
        q.pushBack(source)
        
        while !q.empty()
        {
            let f = q.popFront()
            
            for element in v[f]
            {
                if !visited[element]
                {
                    visited[element] = true
                    q.pushBack(element)
                    parents[element] = f
                }
            }
        }
        
        var path = [Int]()
        var parent = destination
        
        while parent != 0
        {
            path.append(parent)
            parent = parents[parent]!
        }
        
        return path.reversed()
    }
    
    /// Returns the number of connected components in this graph.
    public func ncc() -> Int
    {
        var visited = [Bool](repeating: false, count: n())
        var connected_components = 0
        
        for start in 0..<n()
        {
            if visited[start]
            {
                bfs1(start, visited: &visited)
                connected_components += 1
            }
        }
        return connected_components
    }
    
    /// Returns true iff this graph is connected; returns false iff it is not connected.
    public func isConnected() -> Bool
    {
        var visited = [Bool](repeating: false, count: n())
        bfs1(0, visited: &visited)
        for element in visited
        {
            if !element
            {
                return false
            }
        }
        return true
    }
    
    /// Returns true iff this graph is complete; returns false iff it is not complete.
    public func isComplete() -> Bool
    {
        for item in v
        {
            if item.count != n() - 1
            {
                return false
            }
        }
        return true
    }
    
    // MARK: Private
    
    private func bfs1(_ start : Int, visited : inout [Bool])
    {
        var q = NRQueue<Int>()
        visited[start] = true
        q.pushBack(start)
        
        while !q.empty()
        {
            let f = q.popFront()
            for element in v[f]
            {
                if !visited[element]
                {
                    visited[element] = true
                    q.pushBack(element)
                }
            }
        }
    }
    
    private var v = [Set<Int>()]
}
