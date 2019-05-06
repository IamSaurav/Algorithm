//
//  BubbleSort.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm. All rights reserved.
//

/*
 Bubble Sort is the simplest sorting algorithm that works by repeatedly swapping every two neighbouring element.
 Basically it compares every two elements and swaps, if left element is greater.
 Thus we get the largest element in every iteration and we move it to the right end.
 We actually need two loops, one loop iterates the input array once.
 Another loop starts from 0...till last. and then it reduces one by one because every time one largest element we get which moved towards right.
 
 Summary: finds largest element and moves it right. It keeps swaping elements to the right.
 
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

class BubbleSort: NSObject {
    func bubbleSort(arr:[Int]) -> [Int] {
        // If there is only one element then no sorting required.
        if arr.count < 1{
            return arr
        }
        // Need to modify so created a variable copy.
        var arr = arr
        // This loop run only once, 0...arr count.
        for i in 0..<arr.count-1 {
            // This loop rund from 0... to last and reduces one loop every time.
            // Because we get the largest number in every iteration. So we keep the largest element at the right end.
            // This loop swaps the adjacent elements, if left one is greater than right one.
            for j in 0..<arr.count - 1 - i {
                if arr[j] > arr[j+1] {
                    let temp = arr[j+1]
                    arr[j+1] = arr[j]
                    arr[j] = temp
                }
            }
        }
        return arr
    }
    
}
