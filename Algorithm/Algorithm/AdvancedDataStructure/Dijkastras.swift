//
//  Dijkastras.swift
//  Algorithm
//
//  Created by 703177729 on 5/15/19.
//  Copyright © 2019 com.fsfes.frewfer. All rights reserved.
//

import UIKit

class Dijkastras: NSObject {
    
    func shortestPaths(graph: Graph) -> [[Int]] {
        let nodes = graph.doBreadthFirstSearch(node: graph.root!)
        var paths = [[Int]].init()
        for i in 0..<nodes!.count{
            let node = nodes![i]
            paths.append([node.data, shortestPath(source: graph.root!, destination: node, graph: graph)])
        }
        return paths
    }
    
    func shortestPath (source: Graph.Node, destination: Graph.Node, graph: Graph) -> Int {
        if source == destination { return 0 }
        
        source.distance = 0
        var toVisit = [Graph.Node]()
        toVisit.append(source)
        
        while !toVisit.isEmpty {
            let node = toVisit.min(by: { (node, node1) -> Bool in
                return node.distance < node.distance
            })!
            
            // Destination reached?
            if node == destination { return node.distance }
            
            // Mark as visited.
            toVisit.remove(at: toVisit.index(of: node)!)
            
            // Update unvisited neighbors.
            for edge in node.edges {
                if let neighbor = edge.destination, !toVisit.contains(neighbor) {
                    toVisit.append(neighbor)
                    let distance = node.distance + edge.weight
                    neighbor.distance = distance < neighbor.distance ? distance : neighbor.distance
                }
            }
        }
        return -1
    }

}







