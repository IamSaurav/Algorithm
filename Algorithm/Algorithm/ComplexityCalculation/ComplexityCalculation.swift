//
//  ComplexityCalculation.swift
//  Algorithm
//
//  Created by 703177729 on 5/13/19.
//  Copyright © 2019 com.fsfes.frewfer. All rights reserved.
//

/*
 When analysing an algorighm or rather a piece of code we have two ways to do so:
 1. Time Complexity
 2. Space Complexity
 The lesser the value of these results the better the algorithm.
 
 Time Complexity is popularly measured using Asymptotic Analysis or Big O.
 
 Asymptotic Analysis: In Asymptotic Analysis, we evaluate how does the time taken by an algorithm increases
 as the input size increases. We don’t measure the actual running time. Asymptotic Analysis is not perfect,
 but that’s the bestway available for analyzing algorithms.
 
 We can have three cases to analyze an algorithm:
 1) Worst Case (Usually asked, when someone just ask complexity, say the wors case.)
     - We calculate upper bound on running time of an algorithm. Symbol O(n). Ohh n.
 2) Average Case (Rarely asked)
     - We take all possible inputs and calculate computing time for all of the inputs. Sum all the calculated...
       values and divide the sum by total number of inputs. Symbol Θ(n), theta n.
 3) Best Case (Nobody asks, still for interview.)
     - We calculate lower bound on running time of an algorithm. Symbol Ω(n). omega n.
 
 Let's try few examples for worst case:
 O(1): if it doesn’t contain loop, recursion and call to any other function.
 O(n): Time Complexity of a loop is considered as O(n) if the loop variables is incremented/decremented by a constant amount.
 O(n^2): Time complexity of nested loops is equal to the number of times the innermost statement is executed.
 O(Logn): Time Complexity of a loop is considered as O(Logn) if the loop variables is divided/multiplied by a constant amount.
 O(LogLogn): Time Complexity of a loop is considered as O(LogLogn) if the loop variables is reduced / increased exponentially by a constant amount.
 */

import UIKit

class ComplexityCalculation: NSObject {
    
    // Worst Case Complexity: O(1)
    func sum(a: Int, b: Int) -> Int {
        return a+b
    }
    
    // Worst Case Complexity: O(n)
    // There is a loop which runs from 0 to array count, that's why n rest of the code will not take..
    // extra time when input time increases.
    func sumOfArray(array:[Int]) -> Int {
        var sum = 0;
        for i in array {
            sum += array[i]
        }
        return sum
    }
    
    // Worst Case Complexity: O(n^2)
    // There are two loops which runs from 0 to array count, that's why n rest of the code will not take..
    // extra time when input time increases.
    func sumOfArrayOfArray(array:[Int], array1:[Int]) -> Int {
        var sum = 0;
        for i in array {
            sum += array[i]
            for j in array {
               sum += array[j]
            }
        }
        return sum
    }
    
    // Worst Case Complexity: O(Logn)
    // There are two loops which runs from 0 to array count, that's why n rest of the code will not take..
    // extra time when input time increases.
    func sumOfHalfOfArray(array:[Int]) -> Int {
        var sum = 0;
        for i in 0..<array.count/2 {
            sum += array[i]
        }
        return sum
    }
    
    // Worst Case Complexity: O(Logn)
    // There are two loops which runs from 0 to array count, that's why n rest of the code will not take..
    // extra time when input time increases.
    func sumOfHalfOfArray1(array:[Int]) -> Int {
        var sum = 0;
        for i in 0..<array.count*2 {
            sum += array[i]
        }
        return sum
    }
    
    // Worst Case Complexity: O(LogLogn)
    // There is one loop whose counter increases with constant time power, here it is 2.
    func sumOfArray2(array:[Int]) -> Int {
        var sum = 0;
        for i in 0..<Int(pow(Double(array.count), Double(2))) {
            sum += array[i]
        }
        return sum
    }
    
    
    
}
