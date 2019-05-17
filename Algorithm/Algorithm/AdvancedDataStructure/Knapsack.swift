//
//  Knapsack.swift
//  Algorithm
//
//  Created by 703177729 on 5/16/19.
//  Copyright © 2019 com.fsfes.frewfer. All rights reserved.
//

/*
 Introduction:
 Definition: Given a Knapsack(bag) of a maximum capacity W and have N items with some weight, throw in the items inside the Knapsack such that the final contents has the maximum value.
 Understanding Through Example:
 Consider a thief gets into a home to rob and he carries a knapsack. There are fixed number of items in the home –
 each with its own weight and value – Jewellery, with less weight and highest value vs tables, with less value,
 but a lot heavy. To add fuel to the fire, the thief has an old knapsack which has limited capacity. Obviously,
 he can’t split the table into half or jewellery into 3/4ths. He either takes it or leaves it
 Refer:
 Program: https://www.programminglogic.com/knapsack-problem-dynamic-programming-algorithm/
 Concept: https://www.hackerearth.com/practice/notes/the-knapsack-problem/
 */

import UIKit

class Knapsack: NSObject {

    class Item {
        var value: Int!
        var weight: Int!
        class func create(value: Int, weight: Int) -> Item {
            let item = Item.init()
            item.value = value
            item.weight = weight
            return item
        }
    }
    
    /*
     
    */
    func knapsack(capacity: Int, items: [Item]) -> Int {
        var knapsackArray = [[Int]](repeating: [Int](repeating: 0, count: capacity+1), count: items.count+1)
        for i in 1...items.count{
            let item = items[i-1]
            for space in 0...capacity {
                if item.weight <= space {
                    let old = knapsackArray[i-1][space]
                    let new = item.value + knapsackArray[i-1][space-item.weight]
                    knapsackArray[i][space] = new > old ? new : old
                }else{
                    knapsackArray[i][space] = knapsackArray[i-1][space];
                }
            }
        }
        return knapsackArray[items.count][capacity]
    }
    
    
}
