//
//  GraphTests.swift
//  AlgorithmTests
//
//  Created by 703177729 on 4/30/19.
//  Copyright © 2019 com.fsfes.frewfer. All rights reserved.
//

import XCTest

@testable import Algorithm
class GraphTests: XCTestCase {

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
        XCTAssertEqual(graph.root?.data, 100)
        XCTAssertEqual(graph.root?.edges.count, 2)
        XCTAssertEqual(graph.root?.edges.first?.source, graph.root)
        XCTAssertEqual(graph.root?.edges.first?.destination, node0)
        XCTAssertEqual(graph.root?.edges[1].destination, node1)
        XCTAssertEqual(graph.root?.edges[1].weight, 1)
        XCTAssertEqual(node0.edges.first?.source, nil)
        
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
        XCTAssertEqual(node1.edges.first?.destination, node2)
        XCTAssertEqual(node1.edges[1].destination, node3)
        XCTAssertEqual(node5.edges.first?.destination, rootNode)
        XCTAssertEqual(node4.edges.first?.source, node4)
        XCTAssertEqual(node5.edges.first?.source, node5)
        XCTAssertEqual(node4.edges.count, 2)
        XCTAssertEqual(node2.edges.count, 3)
    }
    
    func testRemoveNode() {
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
        graph.addEdge(source: node2, destination: node4, weight: 2)
        graph.addEdge(source: node2, destination: node5, weight: 2)
        graph.addEdge(source: node3, destination: node4, weight: 3)
        graph.addEdge(source: node4, destination: node5, weight: 3)
        graph.addEdge(source: node4, destination: node2, weight: 4)
        graph.addEdge(source: node5, destination: rootNode, weight: 100)
        node1.removeEdge(data: 2)
        XCTAssertEqual(node1.edges.count, 1)
        node1.removeEdge(data: 3)
        XCTAssertEqual(node1.edges.count, 0)
        node4.removeEdge(data: 2)
        XCTAssertEqual(node4.edges.count, 1)
        XCTAssertEqual(node4.edges.first?.weight, 3)
        XCTAssertEqual(node2.edges[2].weight, 2)
    }
    
    func testBFS() {
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
        graph.addEdge(source: node2, destination: node4, weight: 2)
        graph.addEdge(source: node2, destination: node5, weight: 2)
        graph.addEdge(source: node3, destination: node4, weight: 3)
        graph.addEdge(source: node4, destination: node5, weight: 3)
        graph.addEdge(source: node4, destination: node2, weight: 4)
        graph.addEdge(source: node5, destination: rootNode, weight: 100)
        
        graph.doBreadthFirstSearch(node: node5)
        
    }

    func testPerformanceExample() {
        self.measure {
        }
    }

}
