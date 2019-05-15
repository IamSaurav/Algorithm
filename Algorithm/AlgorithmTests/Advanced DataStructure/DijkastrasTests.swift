
//
//  Dijkastras.swift
//  AlgorithmTests
//
//  Created by 703177729 on 5/15/19.
//  Copyright © 2019 com.fsfes.frewfer. All rights reserved.
//

import UIKit
import XCTest

@testable import Algorithm
class DijkastrasTests: XCTestCase {
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    func testAddNode() {
        let rootNode = Graph.Node.create(data: 100, edges: [])
        let graph = Graph.create(rootNode: rootNode)
        let node0 = Graph.Node.create(data: 0, edges: [])
        let node1 = Graph.Node.create(data: 1, edges: [])
        graph.addEdge(source: rootNode, destination: node0, weight: 1)
        graph.addEdge(source: rootNode, destination: node1, weight: 1)
        let node2 = Graph.Node.create(data: 2, edges: [])
        let node3 = Graph.Node.create(data: 3, edges: [])
        graph.addEdge(source: node1, destination: node2, weight: 2)
        graph.addEdge(source: node1, destination: node3, weight: 2)
        graph.addEdge(source: node2, destination: node3, weight: 3)
        let node4 = Graph.Node.create(data: 4, edges: [])
        let node5 = Graph.Node.create(data: 5, edges: [])
        graph.addEdge(source: node2, destination: node4, weight: 3)
        graph.addEdge(source: node2, destination: node5, weight: 3)
        graph.addEdge(source: node3, destination: node4, weight: 3)
        graph.addEdge(source: node4, destination: node5, weight: 3)
        graph.addEdge(source: node4, destination: node2, weight: 3)
        graph.addEdge(source: node5, destination: rootNode, weight: 100)

        let dijkastras = Dijkastras.init()
        var distance = dijkastras.shortestPath(source: graph.root!, destination: graph.root!, graph: graph)
        XCTAssertEqual(distance, 0)
        distance = dijkastras.shortestPath(source: graph.root!, destination: node5, graph: graph)
        XCTAssertEqual(distance, 6)
        distance = dijkastras.shortestPath(source: graph.root!, destination: node4, graph: graph)
        XCTAssertEqual(distance, 6)
        distance = dijkastras.shortestPath(source: graph.root!, destination: node2, graph: graph)
        XCTAssertEqual(distance, 3)
        distance = dijkastras.shortestPath(source: graph.root!, destination: node1, graph: graph)
        XCTAssertEqual(distance, 1)
        
        let paths = dijkastras.shortestPaths(graph: graph)
        print(paths)
    }
    
}
