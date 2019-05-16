//
//  KnapsackTests.swift
//  AlgorithmTests
//
//  Created by 703177729 on 5/16/19.
//  Copyright © 2019 com.fsfes.frewfer. All rights reserved.
//

import XCTest

@testable import Algorithm
class KnapsackTests: XCTestCase {
    
    override func setUp() {
        
    }
    
    override func tearDown() {
        
    }
    
    func testKnapsack() {
        var values = [10, 50, 70 ]
        var weights = [10, 20, 30]
        let knap = Knapsack.init()
        var result = knap.knapsack(capacity: 40, weights: weights, values: values)
        XCTAssertEqual(result, 80)
        result = knap.knapsack(capacity: 140, weights: weights, values: values)
        XCTAssertEqual(result, 130)
        result = knap.knapsack(capacity: 30, weights: weights, values: values)
        XCTAssertEqual(result, 70)
        
        values = [20, 70, 40, 20, 10, 22]
        weights = [20, 70, 40, 20, 10, 22]
        result = knap.knapsack(capacity: 40, weights: weights, values: values)
        XCTAssertEqual(result, 40)
        
        values = [20, 70, 40, 25, 10, 132]
        weights = [10, 5, 20, 30, 40, 52]
        result = knap.knapsack(capacity: 52, weights: weights, values: values)
        XCTAssertEqual(result, 132)
        result = knap.knapsack(capacity: 50, weights: weights, values: values)
        XCTAssertEqual(result, 130)

        
    }
    
}
