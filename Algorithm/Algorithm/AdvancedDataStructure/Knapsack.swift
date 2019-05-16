//
//  Knapsack.swift
//  Algorithm
//
//  Created by 703177729 on 5/16/19.
//  Copyright © 2019 com.fsfes.frewfer. All rights reserved.
//

import UIKit

class Knapsack: NSObject {

    func knapsack(capacity: Int, weights:[Int], values:[Int]) -> Int {
        var knapsackArray = [[Int]](repeating: [Int](repeating: 0, count: capacity+1), count: values.count+1)
        for i in 0...values.count{
            for w in 0...capacity{
                if i == 0 || w == 0{
                    knapsackArray[i][w] = 0
                }
                else if weights[i - 1] <= w {
                    let value = knapsackArray[i-1][w]
                    let newValue = values[i-1] + knapsackArray[i-1][w-weights[i-1]]
                    knapsackArray[i][w] = value > newValue ? value : newValue
                }else{
                    knapsackArray[i][w] = knapsackArray[i - 1][w];
                }
            }
        }
        return knapsackArray[values.count][capacity]
    }
    
    
}
