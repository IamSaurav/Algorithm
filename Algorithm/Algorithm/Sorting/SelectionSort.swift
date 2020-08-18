//
//  SelectionSort.swift
//  Algorithm
//
//  Created by 703177729 on 13/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm. All rights reserved.
//

/*
 Selection Sort:
 It starts by selecting the first element and then keeps comparing it with next element till it reaches last.
 While comparing if it finds any element, smaller than the selected one, then it will keep the index of that element..
 and for next comparisions it usage the value of this index until it finds even smaller element.
 At the end, it will find the samllest element and swap it with the selected element.
 By doing this we get smallest item in every iteration and we keep those in the left side of the array.
 After every iteration it starts from next element of the last selected one.
 Which means it keep reducing the number of elements to be sorted.
 As this approach selects an element and compare with others, that's why it's called Selection Sort.
 
 Summary: finds smallest element and moves it to left. It keeps track of index of smaller element & doesn't swap until gets smallest.
 
 Example below.
 
 arr[] = 64 25 12 22 11

 // Find the minimum element in arr[0...4]
 // Find the minimum element and place it in sorted array.
 11    25 12 22 64

 // Find the minimum element in arr[1...4]
 // Find the minimum element and place it in sorted array.
 11 12   25 22 64

 // Find the minimum element in arr[2...4]
 // Find the minimum element and place it in sorted array.
 11 12 22   25 64

 // Find the minimum element and place it in sorted array.
 11 12 22 25 64
*/

import UIKit

public class SelectionSort {
    
    public func selectionSort1(_ arr: [Int]) -> [Int] {
        // Need to modify so created a variable copy.
        var arr = arr
        // This loop used for selection of element, it starts selecting item from start to end.
        for i in 0..<arr.count {
            // Initially we take i'th element as selected element for comparision but later when we smaller element we make it as selected element. Actually we keep track of the index of element and not the exact element.
            var selectedItemIndex = i
            // This loop used for comparing and finding smallest element in rest of the array(next of selected element.. to last).
            // As soon as we get a smaller element than the selected one we make that as the selected element.
            for j in i+1..<arr.count {
                if arr[j] < arr[selectedItemIndex]{
                    selectedItemIndex = j
                }
            }
            // At the point we got smallest element. Now we will exchange it with initally selected element.
            let temp = arr[i]
            arr[i] = arr[selectedItemIndex]
            arr[selectedItemIndex] = temp
        }
        return arr
    }
    public func selectionSort(_ array: [Int]) -> [Int] {
        var arr = array
        for i in 0..<arr.count {
            var minIndex = i
            for j in i+1..<arr.count{
                if arr[j] < arr[minIndex] {
                    minIndex = j
                }
            }
            arr.swapAt(i, minIndex)
        }
        return arr
    }
    
}
