//
//  Graph.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm. All rights reserved.
//

/********** INTRODUCTION **************
 A Graph is a non-linear data structure consisting of nodes and edges. Edges connect two nodes.
 Every edge have weight, source and destination.
 One node can have multiple edges connected to it.
 Adjacenct − Two nodes are adjacent if they are connected to each other through an edge. A---B
 Use Case: Computer networks, social networks, Map etc.
 A graph can be directed or undirected.
 Dircted Graph: When nodes are connected in only one way and can be traversed in single direction..like O----O----O
 Undircted Graph: When nodes are connected with multiple nodes and can be traversed in multiple direction.
 Refer: https://www.mathworks.com/help/matlab/math/directed-and-undirected-graphs.html
 To travarse or search in Graph, there are two approaches followed.
    1. Breadth First Search
        -- As the name suggests we will traverse nodes in breadth or horizonatlly.
        -- Need a queue to do this opeartion.
        -- Refer: https://www.tutorialspoint.com/data_structures_algorithms/breadth_first_traversal.htm
    2. Depth First Search
        -- As the name suggests we will traverse nodes in depth or vertically.
        -- Need a stack to do this opeartion.
        -- Refer: https://www.tutorialspoint.com/data_structures_algorithms/depth_first_traversal.htm
 ********** INTRODUCTION **************/


import UIKit

class Graph: NSObject {
    private(set) var root: Node?

    public class Edge: NSObject {
        var weight: Int!
        var source: Node?
        var destination: Node?
        public class func create(source: Node, destination: Node, weight: Int) -> Edge {
            let edge = Edge.init()
            edge.source = source
            edge.destination = destination
            edge.weight = weight
            return edge
        }
    }
    
    public class Node: NSObject {
        var data: Int!
        var edges: [Edge] = []
        var distance = Int.max

        public class func create(data: Int, edges: [Edge]) -> Node {
            let node = Node.init()
            node.edges = edges
            node.data = data
            return node
        }
        
        @discardableResult
        func addEdge(weight: Int, destination: Node) -> Edge {
            let edge = Edge.create(source: self, destination: destination, weight: weight)
            self.edges.append(edge)
            return edge
        }
        
        func removeEdge(data: Int) {
            if let index = edges.index(where: { $0.destination?.data == data}){
                edges.remove(at: index)
            }
        }
        
        func isConnected(node: Node) -> Bool {
            return edges.contains(where: {  $0.destination == node })
        }
        
    }
    
    
    public class func create(rootNode: Node) -> Graph {
        let graph = Graph.init()
        graph.root = rootNode
        return graph
    }
    
    func addNode(source: Node, destination: Node, weight: Int) {
        source.addEdge(weight: weight, destination: destination)
        if root == nil{
            root = source
        }
    }
    
    func removeNode(node: Node) {
        if let index = node.edges.index(where: { $0 == node}){
            node.edges.remove(at: index)
            node.edges.forEach({ n in
                if (n.destination?.isConnected(node: node)) != nil{
                    n.destination?.removeEdge(data: node.data)
                }
            })
        }
    }
    
    @discardableResult
    func addEdge(source: Node, destination: Node, weight: Int) -> Edge {
        return source.addEdge(weight: weight, destination: destination)
    }
    
    // First move horizontally and visit all the nodes of the current layer then move to the next layer
    @discardableResult
    func doBreadthFirstSearch(node: Node) -> [Node]? {
        var visited = [Node]()
        let queue = GenericQueue.init()
        visited.append(node)
        queue.enque(data: node)
        while queue.size > 0 {
            if let top = queue.deque() as? Node {
                print(top.data)
                top.edges.forEach({ edge in
                    if !visited.contains(edge.destination!) {
                        visited.append(edge.destination!)
                        queue.enque(data: edge.destination!)
                    }
                })
            }
        }
        return visited
    }

    // It navigates from one node to it's adjacent one unvisited node and find again  one unvisited node and so on.
    // First move vertically and visit till it finds the node or reaches a leaf node
    @discardableResult
    func doDepthFirstSearch(node: Node) -> [Node]? {
        var visited = [Node]()
        let stack = GenericStack.init()
        visited.append(node)
        stack.push(data: node)
        while !stack.isEmpty() {
            if let top = stack.pop() as? Node {
                print(top.data)
                top.edges.forEach({ edge in
                    if !visited.contains(edge.destination!) {
                        visited.append(edge.destination!)
                        stack.push(data: edge.destination!)
                    }
                })
            }
        }
        return visited
    }
    
    // It is depth first search and on top of that all we do is check if any visited node we come accross,
    // that means there is a cycle.
    // eg.1.  A connected to B and B connected to C then C connected to A
    // eg.1.  A connected to B and B connected to A. It is also called back edge.
    func isCyclic(node: Node) -> Bool {
        var isCyclic = false
        var visited = [Node]()
        let stack = GenericStack.init()
        visited.append(node)
        stack.push(data: node)
        while !stack.isEmpty() {
            if let top = stack.pop() as? Node {
                print(top.data)
                top.edges.forEach({ edge in
                    if !visited.contains(edge.destination!) {
                        visited.append(edge.destination!)
                        stack.push(data: edge.destination!)
                    }else{
                        isCyclic = true
                    }
                })
            }
        }
        return isCyclic
    }
    
    
}
