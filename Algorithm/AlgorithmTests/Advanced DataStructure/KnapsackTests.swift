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
        var items = [Knapsack.Item].init()
        items.append(Knapsack.Item.create(value: 10, weight: 10))
        items.append(Knapsack.Item.create(value: 20, weight: 50))
        items.append(Knapsack.Item.create(value: 70, weight: 30))
        let knap = Knapsack.init()
        var maxValue = knap.knapsack(capacity: 40, items: items)
        XCTAssertEqual(maxValue, 80)
        maxValue = knap.knapsack(capacity: 140, items: items)
        XCTAssertEqual(maxValue, 100)
        maxValue = knap.knapsack(capacity: 30, items: items)
        XCTAssertEqual(maxValue, 70)

        items.removeAll()
        items.append(Knapsack.Item.create(value: 20, weight: 20))
        items.append(Knapsack.Item.create(value: 70, weight: 70))
        items.append(Knapsack.Item.create(value: 40, weight: 40))
        items.append(Knapsack.Item.create(value: 20, weight: 20))
        items.append(Knapsack.Item.create(value: 10, weight: 10))
        items.append(Knapsack.Item.create(value: 22, weight: 22))
        maxValue = knap.knapsack(capacity: 40, items: items)
        XCTAssertEqual(maxValue, 40)
        
        items.removeAll()
        items.append(Knapsack.Item.create(value: 20, weight: 10))
        items.append(Knapsack.Item.create(value: 70, weight: 5))
        items.append(Knapsack.Item.create(value: 40, weight: 20))
        items.append(Knapsack.Item.create(value: 20, weight: 30))
        items.append(Knapsack.Item.create(value: 10, weight: 40))
        items.append(Knapsack.Item.create(value: 22, weight: 52))

        maxValue = knap.knapsack(capacity: 52, items: items)
        XCTAssertEqual(maxValue, 130)
        maxValue = knap.knapsack(capacity: 50, items: items)
        XCTAssertEqual(maxValue, 130)
        
        items.removeAll()
        items.append(Knapsack.Item.create(value: 1, weight: 1))
    }
    
}
