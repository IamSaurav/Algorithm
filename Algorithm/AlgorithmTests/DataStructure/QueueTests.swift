//
//  QueueTests.swift
//  AlgorithmTests
//
//  Created by 703177729 on 26/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm. All rights reserved.
//

import XCTest
@testable import Algorithm

class QueueTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    func testEnque() {
        let queue = Queue.init()
        queue.enque(data: 5)
        XCTAssertEqual(queue.first?.data, 5)
        queue.enque(data: 6)
        queue.enque(data: -60009)
        XCTAssertEqual(queue.peek(), 5)
        XCTAssertEqual(queue.size, 3)
        XCTAssertEqual(queue.deque(), 5)
        XCTAssertEqual(queue.deque(), 6)
        XCTAssertEqual(queue.deque(), -60009)
        XCTAssertEqual(queue.deque(), nil)
    }
    
    func testDeque() {
        let queue = Queue.init()
        queue.enque(data: 23)
        XCTAssertEqual(queue.deque(), 23)
        queue.enque(data: 24)
        queue.enque(data: 25)
        queue.enque(data: 26)
        XCTAssertEqual(queue.size, 3)
        queue.deque()
        XCTAssertEqual(queue.size, 2)
        XCTAssertEqual(queue.deque(), 25)
        XCTAssertEqual(queue.size, 1)
        XCTAssertEqual(queue.deque(), 26)
        XCTAssertEqual(queue.size, 0)
        XCTAssertEqual(queue.deque(), nil)
        XCTAssertEqual(queue.size, 0)
    }
    
    func testIsEmpty() {
        let queue = Queue.init()
        for _ in 0..<3000 {
            queue.deque()
        }
        XCTAssertEqual(queue.isEmpty(), true)
        queue.enque(data: 10)
        XCTAssertEqual(queue.isEmpty(), false)
    }
    
    func testPeek() {
        let queue = Queue.init()
        queue.enque(data: 20)
        XCTAssertEqual(queue.peek(), 20)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            
        }
    }
    
}
