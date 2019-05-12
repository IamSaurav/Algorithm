//
//  QuickSort.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm. All rights reserved.
//

/*
 Quicksort is a divide and conquer algorithm. Quicksort first divides a large array into two smaller sub-arrays.
 The smaller elements and the greater elements. Then recursively sort the sub-arrays. The steps are:
 Steps:
 1. Choose one element from array. This element is called pivot.
 2. Recursively move smaller than pivot element in left side, and greater than this on right side.
 */

import UIKit

class QuickSort: NSObject {
    func quickSort(array: [Int]) -> [Int]{
        if array.count < 1{
            return array
        }
        var array = array
        quickSort(array: &array, low: 0, high: array.count-1)
        return array
    }
    
    /*
      QuickSort method takes array as input and a boudary of low and high within the array.
      Within the boundary it performs partirioning to ultimately sort.
      It chooses one element(pivot), then move the items smaller than pivot towards left, and greater than pivot towards right.
      It maintains two counters i and j. i for smaller items and j for greater items.
      Runs loop as long as it finds a smaller than pivot item, when it finds a smaller item it increases the counter 'i'
      Runs loop as long as it finds a greater than pivot item, when it finds a greater item it increases the counter 'j'
      So, after running these two loops we get one item which is greater than pivot on left side, one smaller on right side.
      There is no gurantee though, if all smaller items are on left of pivot and all greater items on right side, then we don't do anything.
      But if we get one one item then we swap.
      Now we check if we finished the the given job, that is to partition all smaller and greater items in given range 'low' to 'high'.
      If not we do the recursive call.
     
      Example: arr a = [10,8,18,15,17,22,11]
      Let's say low = 1 high = 5
      So i = 1 j = 5 pivot = arr[5] = 22
      We will increase i only when we find an element smaller then pivot.
      We will increase i only when we find an element greater then pivot.
      8 < 22  true, so increase i, i=2
      18 < 22  true, so increase i, i=3
      15 < 22  true, so increase i, i=4
      17 < 22  true, so increase i, i=5
      22 < 22  false, so don;t increase i, i=5
     
      22 > 22  false so don't increase j, j=1 Exit the loop
     
      Now swap the items, i<=j as i = 5 & j=5
      Then increase i and decrease j
     
      8 < 22  true, so increase i, i=2
      18 < 22  true, so increase i, i=3
      15 < 22  true, so increase i, i=4
      17 < 22  true, so increase i, i=5
      22 < 22  false, so don;t increase i, i=5
     
      22 > 22  false so don't increase j, j=1 Exit the loop
    */
    func quickSort(array: inout [Int], low: Int, high: Int){
        // You can choose 'Pivot' as any element of array, but here for simplicity we used the last one.
        let pivot = array[high]
        // We keep the counter 'low' & 'high' unmodified, because these are the limits within which partitioning has to happen.
        // If we modify low & high then we may move elements which are already sorted in last few iterations.
        var i = low
        var j = high
        while (i < j) {
            while (array[i] < pivot) {
                i += 1
            }
            while (array[j] > pivot) {
                j -= 1
            }
            // i <= j means we have't moved all the items smaller than pivot to the left & greater to the right. Also we found..
            // one smaller on right side of pivot, and one greater on left side of pivot which is not correct, so will swap..
            // and increase both counters.
            // While increasing, i can reach up to j because after comparing we're increasing, but it will never be greater than j.
            if i <= j {
                let temp = array[i]
                array[i] = array[j]
                array[j] = temp
                i += 1
                j -= 1
            }
        }
        // Now we partition further within the given range.
        
        // low < j means we still have few more items left on left side of pivot, which may be smaller or greater than pivot.
        // So call again recursively.
        // But now the j has difinetely decreased, and in next iteration it will decrease further.
        // By passing low, we are keeping the given starting range intact, but we're reducing the range by passing j.
        if j > low {
            quickSort(array: &array, low: low, high: j)
        }
        // high > i means we still have few more items left on right side of pivot, which may be smaller or greater than pivot.
        // So call again recursively.
        // But now the i has definitely increased, and in next iteration it will increase further.
        // By passing high we are keeping the given range intact, but we're reducing the range by passing i.
        if i < high {
            quickSort(array: &array, low: i, high: high)
        }
    }
    
}
