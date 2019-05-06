//
//  InsertionSort.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm. All rights reserved.
//

/*
 Insertion sort is like playing cards, while suffling we insert unsorted element down the stack.
 It imagines sorted and unsorted list within the input array.
 At each iteration, insertion sort finds one element and moves it to the location it belongs within the sorted list.
 It repeats until no input elements remain.
 
 Summary: takes first two elements, sorts by keep swaping, then takes first three elements, sorts by keep swaping, and it goes on.
 
 Example Steps:
 
 5 1 4 2 8
 
 First Iteration
 Compare 5 & 1. 1 is smaller so swap.
 1 5 4 2 8
 Next Compare 5 & 4. 4 is smaller so swap.
 1 4 5 2 8
 Next Compare 5 & 2. 2 is smaller so swap.
 1 4 2 5 8
 Next Compare 5 & 8. 8 is greater so no swap.
 1 4 2 5 8
 
 Second Iteration
 1 4 2 5 8
 
 Compare 1 & 4. 4 is greater so no swap.
 1 4 2 5 8
 Compare 4 & 2. 4 is greater so swap.
 1 2 4 5 8
 Next Compare 4 & 5. 5 is greater so no swap.
 1 2 4 5 8
 
 Third Iteration
 Already Sorted -- No Action
 
 Fourth Iteration
 Already Sorted -- No Action
 
 Fifth Iteration
 Already Sorted -- No Action
 */

import UIKit

class InsertionSort: NSObject {
    
    func insertionSort(arr: [Int]) -> [Int] {
        // When only one objector less then it's already sorted.
        if arr.count < 1{
            return arr
        }
        // Need to modify so created a variable copy.
        var arr = arr
        // The outer loop runs over all the elements except the first one, because single-element is by default sorted.
        // As it imagines two array: sorted and unsorted within the input array.
        // While iterating it keeps moving one element to the sorted part.
        for i in 1..<arr.count {
            var j = i
            // It compares every two adjacent elements, if it finds left one is greater then it swaps.
            // Every time it takes one extra element within it's fold to be sorted.
            // As you can see it sorts first 2 elements, then first 3 elements and it goes on....till it hits the end.
            // While sorting it starts from 2..1 then 3...1 then 4...1 till the end.
            // Q: Now you may be thinking it is greater then 0 then how it will reach to first
            // Ans: arr[j-1] serves the purpose. When it reches 1.. j-1 will be 0. Thus it comapres till first element with second element.
            while j > 0 && arr[j-1] > arr[j] {
                let temp = arr[j]
                arr[j] = arr[j-1]
                arr[j-1] = temp
                j -= 1
            }
        }
        return arr
    }

    
}
