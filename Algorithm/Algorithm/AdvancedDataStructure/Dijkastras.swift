//
//  Dijkastras.swift
//  Algorithm
//
//  Created by 703177729 on 5/15/19.
//  Copyright © 2019 com.fsfes.frewfer. All rights reserved.
//

import UIKit

class Dijkastras: NSObject {
    
//    func shortestPath (source: Graph.Node, destination: Graph.Node, graph: Graph) -> Int {
//        if source == destination { return 0 }
//        var currentNode = source
//        currentNode.isVisited = true
//        currentNode.minDistanceToStart = 0
//        var toVisit = [Graph.Node]()
//        toVisit.append(currentNode)
//        while !toVisit.isEmpty {
//            toVisit = toVisit.filter{ $0 != currentNode }
//            currentNode.isVisited = true
//            // Go to each adjacent vertex and update the path length
//            for connectedEdge in currentNode.edges {
//                let currentDistanceToStart = currentNode.minDistanceToStart + (connectedEdge.weight ?? 0)
//                if let destination = connectedEdge.destination {
//                    if (currentDistanceToStart < destination.minDistanceToStart) {
//                        destination.minDistanceToStart = currentDistanceToStart
//                        toVisit.append(destination)
//                        destination.isVisited = !destination.isVisited
//                    }
//                }
//            }
//            currentNode.isVisited = true
//            //set current node to the smallest vertex
//            if !toVisit.isEmpty {
//                currentNode = toVisit.min(by: { (a, b) -> Bool in
//                    return a.minDistanceToStart < b.minDistanceToStart
//                })!
//            }
//            if (currentNode == destination) {
//                return currentNode.minDistanceToStart
//            }
//        }
//        return -1
//    }

    func shortestPath (source: Graph.Node, destination: Graph.Node, graph: Graph) -> Int {
        if source == destination { return 0 }
        
        source.distanceFromSource = 0
        var toVisit = [Graph.Node]()
        toVisit.append(source)
        while !toVisit.isEmpty {
            let node = toVisit.min(by: { (node, node1) -> Bool in
                return node.distanceFromSource < node.distanceFromSource
            })!
            
            // Destination reached?
            if node == destination { return node.distanceFromSource }
            
            // Mark as visited.
            node.isVisited = true
            // Remove that node from Queue.
            if let index = toVisit.index(of: node){
                toVisit.remove(at: index)
            }
            
            // Update unvisited neighbors.
            for edge in node.edges where !(edge.destination?.isVisited ?? true) {
                if let neighbor = edge.destination {
                    toVisit.append(neighbor)
                    let distance = node.distanceFromSource + edge.weight
                    neighbor.distanceFromSource = distance < neighbor.distanceFromSource ? distance : neighbor.distanceFromSource
                }
            }
        }
        return -1
    }

}





