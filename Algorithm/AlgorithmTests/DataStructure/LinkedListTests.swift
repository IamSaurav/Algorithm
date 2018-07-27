//
//  LinkedListTests.swift
//  AlgorithmTests
//
//  Created by Saurav Satpathy on 28/07/18.
//  Copyright © 2018 com.fsfes.frewfer. All rights reserved.
//

import XCTest
@testable import Algorithm

class LinkedListTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    func testInsert() {
        let list = LinkedList.init()
        list.insert(data: 5)
        XCTAssertEqual(list.head?.data, 5)
        list.insert(data: 6)
        list.insert(data: -60009)
        XCTAssertEqual(list.head?.data, 5)
        XCTAssertEqual(list.size, 3)
    }
    
    func testDelete() {
        let list = LinkedList.init()
        list.insert(data: 23)
        XCTAssertEqual(list.delete(), 23)
        list.insert(data: 24)
        list.insert(data: 25)
        list.insert(data: 26)
        list.delete()
        XCTAssertEqual(list.delete(), 25)
    }
    
    func testIsEmpty() {
        let list = LinkedList.init()
        for _ in 0..<3000 {
            list.delete()
        }
        XCTAssertEqual(list.isEmpty(), true)
        list.insert(data: 10)
        XCTAssertEqual(list.isEmpty(), false)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            //            for i in 0..<3000 {
            //                let stack = Stack.init()
            //                stack.push(data: i)
            //            }
        }
    }
    
}
