

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
    
    func testPerformanceExample() {
        self.measure {
        }
    }
}
