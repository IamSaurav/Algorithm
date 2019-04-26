//
//  TreeTests.swift
//  AlgorithmTests
//
//  Created by Saurav Satpathy on 29/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm. All rights reserved.
//

import XCTest
@testable import Algorithm

class TreeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInsert() {
        let tree = Tree.init()
        tree.insert(data: 20)
        XCTAssertEqual(tree.root?.data, 20)
        tree.insert(data: 8)
        tree.insert(data: -90020)
        XCTAssertEqual(tree.root?.data, 20)
    }
    
    func testDelete() {
        let tree = Tree.init()
        tree.insert(data: 20)
        tree.insert(data: 7)
        tree.insert(data: 10)
        tree.insert(data: 11)
        tree.insert(data: 11)
        tree.insert(data: 8)
        tree.insert(data: 22)
        tree.insert(data: -9)
        tree.deleteNode(data: 20)

        tree.deleteNode(data: 7)
        tree.deleteNode(data: -9)
        tree.deleteNode(data: 10)
        tree.deleteNode(data: 8)
        tree.deleteNode(data: 22)
        tree.deleteNode(data: 11)
        tree.deleteNode(data: 11)
        tree.deleteNode(data: 20)
        
//        XCTAssertEqual(tree.root?.data, 20)
//        tree.deleteNode(data: 20)
        
        tree.readNodes().forEach { (node) in
            print(node.data)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
