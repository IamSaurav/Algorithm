

//
//  AVLTreeTests.swift
//  AlgorithmTests
//
//  Created by 703177729 on 5/9/19.
//  Copyright © 2019 com.fsfes.frewfer. All rights reserved.
//

import XCTest

@testable import Algorithm
class AVLTreeTests: XCTestCase {

    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    func testInsert() {
        let avlTree = AVLTree.init()
        avlTree.insert(data: 20)
        XCTAssertEqual(avlTree.root?.data, 20)
        avlTree.insert(data: 8)
        avlTree.insert(data: -90020)
        var nodes: [Int] = [Int].init()
        avlTree.inOrderTraverse(n: avlTree.root, nodes: &nodes)
        XCTAssertEqual(avlTree.root?.data, 8)
    }
    
    func testDelete() {
        let avlTree = AVLTree.init()
        avlTree.insert(data: 20)
        avlTree.insert(data: 7)
        avlTree.insert(data: 10)
        avlTree.insert(data: 11)
        avlTree.insert(data: 11)
        avlTree.insert(data: 8)
        avlTree.insert(data: 22)
        avlTree.insert(data: -9)
        
        avlTree.delete(data: 7)
        avlTree.delete(data: -9)
        avlTree.delete(data: 10)
        avlTree.delete(data: 8)
        avlTree.delete(data: 22)
        avlTree.delete(data: 11)
        avlTree.delete(data: 11)
        avlTree.delete(data: 20)
        
//        alvTree.readNodes().forEach { (node) in
//            print(node.data)
//        }
    }
    
    func testReverse() {
        let avlTree = AVLTree.init()
        avlTree.insert(data: 20)
        avlTree.insert(data: 7)
        avlTree.insert(data: 10)
        avlTree.insert(data: 11)
        avlTree.insert(data: 11)
        avlTree.insert(data: 8)
        avlTree.insert(data: 22)
        avlTree.insert(data: -9)
        var nodes: [Int] = [Int].init()
        print("Before Reverse: ")
        avlTree.inOrderTraverse(n: avlTree.root, nodes: &nodes)
        avlTree.reverseTree(node: avlTree.root)
        print("After Reverse: ")
        avlTree.inOrderTraverse(n: avlTree.root, nodes: &nodes)
    }
    
    func testPerformanceExample() {
        self.measure {
        }
    }
}
