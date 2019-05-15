//
//  Dijkastras.swift
//  Algorithm
//
//  Created by 703177729 on 5/15/19.
//  Copyright © 2019 com.fsfes.frewfer. All rights reserved.
//

import UIKit

class Dijkastras: NSObject {
    
    func shortestPath (source: Node, destination: Node, graph: Graph) -> Int {
        if source == destination { return 0 }
        
        source.distance = 0
        var toVisit = [Node]()
        toVisit.append(source)
        while !toVisit.isEmpty {
            let node = toVisit.min(by: { (node, node1) -> Bool in
                return node.distance < node.distance
            })!
            
            // Destination reached?
            if node == destination { return node.distance }
            
            // Mark as visited.
            node.isVisited = true
            toVisit.remove(at: toVisit.index(of: node)!)
            
            // Update unvisited neighbors.
            for edge in node.edges {
                if let neighbor = edge.destination as? Node, !neighbor.isVisited {
                    toVisit.append(neighbor)
                    let distance = node.distance + edge.weight
                    neighbor.distance = distance < neighbor.distance ? distance : neighbor.distance
                }
            }
        }
        return -1
    }

}


class Node: Graph.Node {
    var distance = Int.max
    var isVisited = false
}





