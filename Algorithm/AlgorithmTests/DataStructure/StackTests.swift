
//
//  StackTests.swift
//  AlgorithmTests
//
//  Created by Saurav Satpathy on 26/07/18.
//  Copyright © 2018 com.fsfes.frewfer. All rights reserved.
//

import XCTest
@testable import Algorithm

class StackTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    func testPush() {
        let stack = Stack.init()
        stack.push(data: 5)
        XCTAssertEqual(stack.top?.data, 5)
        stack.push(data: 6)
        stack.push(data: -60009)
        XCTAssertEqual(stack.top?.data, -60009)
        XCTAssertEqual(stack.size, 3)
    }
    
    func testPop() {
        let stack = Stack.init()
        stack.push(data: 23)
        XCTAssertEqual(stack.pop(), 23)
    }
    
    func testIsEmpty() {
        let stack = Stack.init()
        for _ in 0..<3000 {
            stack.pop()
        }
        XCTAssertEqual(stack.isEmpty(), true)
        stack.push(data: 10)
        XCTAssertEqual(stack.isEmpty(), false)
    }
    
    func testPeek() {
        let stack = Stack.init()
        stack.push(data: 20)
        XCTAssertEqual(stack.peek(), 20)
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
