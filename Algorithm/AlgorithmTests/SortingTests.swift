//
//  SortingTests.swift
//  AlgorithmTests
//
//  Created by 703177729 on 13/07/18.
//  Copyright © 2018 com.fsfes.frewfer. All rights reserved.
//

import XCTest
import UIKit

class SortingTests: XCTestCase {

    typealias SortFunction = ([Int]) -> [Int]
    var sortFunction: SortFunction!
    
    override func setUp() {
        super.setUp()
        sortFunction = SelectionSort.init().selectionSort
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEmptyArraySort() {
        let unsortedArray: [Int] = []
        let sortedArray = sortFunction(unsortedArray)
        XCTAssertEqual(sortedArray, [])
    }
    
    func testSingleItemArraySort() {
        let unsortedArray: [Int] = [0]
        let sortedArray = sortFunction(unsortedArray)
        XCTAssertEqual(sortedArray, [0])
    }
    
    func testExtremeValueArraySort() {
        let unsortedArray: [Int] = [1,-1,0,-12324324,48549875894,57475,5,-00002,7543]
        let sortedArray = sortFunction(unsortedArray)
        XCTAssertEqual(sortedArray, [-12324324,-00002,-1,0,1,5,7543,57475,48549875894])
    }
    
    func testNegativeValueArraySort() {
        let unsortedArray: [Int] = [-3,-2,-1]
        let sortedArray = sortFunction(unsortedArray)
        XCTAssertEqual(sortedArray, [-3,-2,-1])
    }
    
    func testMixOfPositiveNegativeArraySort() {
        let unsortedArray: [Int] = [-1,0,1,2,3,4,5]
        let sortedArray = sortFunction(unsortedArray)
        XCTAssertEqual(sortedArray, [-1,0,1,2,3,4,5])
    }
    
    func testSortedArraySort() {
        let unsortedArray: [Int] = [0,1,2,3,4,5]
        let sortedArray = sortFunction(unsortedArray)
        XCTAssertEqual(sortedArray, [0,1,2,3,4,5])
    }

    func testExample() {
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    

    
    
}
