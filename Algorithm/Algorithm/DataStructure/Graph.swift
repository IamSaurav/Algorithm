//
//  Graph.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm. All rights reserved.
//

import UIKit

class Graph: NSObject {
    var root: Node?
    public var isUndirected: Bool = true
    
    public class Edge: NSObject {
        var weight: Int?
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
            //                let destEdge = Edge.create(source: destination, destination: self, weight: weight)
            //                destination.edges.append(destEdge)
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
    
//    // First move horizontally and visit all the nodes of the current layer then move to the next layer
//    @discardableResult
//    func doBreadthFirstSearch() -> [Node]? {
//        var visited = [Node]()
//        let queue = Queue.init()
//        visited.append(root!)
//        queue.enqueue(data: root!)
//        while queue.size > 0 {
//            if let top = queue.poll() as? Node {
//                print("Polled Data", top.data)
//                top.edges.forEach({ edge in
//                    if !visited.contains(edge.destination!) {
//                        visited.append(edge.destination!)
//                        queue.enqueue(data: edge.destination!)
//                    }
//                })
//            }
//        }
//        return visited
//    }
//
//    // It navigates from one node to it's adjacent one unvisited node and find again  one unvisited node and so on.
//    // First move vertically and visit till it finds the node or reaches a leaf node
//    @discardableResult
//    func doDepthFirstSearch() -> [Node]? {
//        var visited = [Node]()
//        let stack = Stack.init()
//        visited.append(root!)
//        stack.push(data: root!)
//        while !stack.isEmpty() {
//            if let top = stack.peek() as? Node {
//                stack.pop()
//                print("Polled Data", top.data)
//                top.edges.forEach({ edge in
//                    if !visited.contains(edge.destination!) {
//                        visited.append(edge.destination!)
//                        stack.push(data: edge.destination!)
//                    }
//                })
//            }
//        }
//        return visited
//    }
}
