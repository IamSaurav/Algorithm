//
//  MergeSort.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm. All rights reserved.
//

/*
 Idea:
 Divide the unsorted list into n sublists, each containing one element (a list of one element is considered sorted).
 Repeatedly merge sublists to produce new sorted sublists until there is only one sublist remaining. This will be the sorted list.
 
 Q: What is Merge?
 Ans: Merge is an algorithm, it plays a critical role in the merge sort algorithm.
      It recursively divide the list into sublists of (roughly) equal length, until each sublist contains only one element.
      A list containing a single element is, by definition, sorted.
      Repeatedly merge sublists to create a new sorted sublist until the single list contains all elements.
      The single list is the sorted list.
 
 Q: How do you sort while merging back 2 or more elements?
 Ans: It is an approach explained below.
      [1 5 6]  [0 2 4]
      1. We will compare these two array elements, by incrasing the counter. We use i for first array, j for second array
      and k to keep the sorted elements.
      2. First we will check if arr[i] < arr[j]
 
 Description:
 Merge Sort is a Divide and Conquer algorithm.
 Refer: https://www.youtube.com/watch?v=yzkzQ7oZwIE
 */

import UIKit

class MergeSort: NSObject {
    
    func mergeSort(array: [Int]) -> [Int]{
        var array = array
        mergeSort(arr: &array, low: 0, high: array.count-1)
        return array
    }
    
    /*
     arr: We modify input array thus inout.
     low: Starting index called as low.
     high: Last or Max index called as high.
    */
    func mergeSort(arr: inout [Int], low: Int, high: Int) {
        if(low < high)
        {
            // It keeps dividing the input array into smaller sublists until it gets single element.
            let mid = (low + high) / 2;
            mergeSort(arr: &arr, low: low, high: mid)
            mergeSort(arr: &arr, low: mid + 1, high: high)
            // Now it compares & merges the small sublists.
            // By name merge() don't get confused, merge is an algorithm which actually compares and merge the elements.
            merge(arr: &arr, low: low, mid: mid, high: high)
        }
    }
    
    func merge(arr: inout [Int], low: Int, mid: Int, high: Int) {
        var tempArr: [Int] = arr
        var i = low
        var k = low
        var j = mid + 1
        // This loop picks the smaller item amongst the two subarrays.
        // eg [1 5 6]  [0 2 4]
        // To sort here we need three counters, i for first array, j for second array and k to keep the sorted items.
        // 1 > 0, thus it will take 0 and place it in the sorted array. Also it will increase the counter only whose item got picked here j.
        // Steps:
        // 1 > 0         arr[k] = 0 j+=1 k+1
        // 1 < 2         arr[k] = 1 i+=1 k+1
        // 5 > 4         arr[k] = 4 i+=1 k+1
        // Now second list exhausted so will copy rest of the items of first list towards the end.
        // arr[k] = 6 i+=1 k+1
        // Q: Why arr[k] ?
        // Ans: Once we got the place of elements it belongs, we place it there in input array.
        while i <= mid && j <= high {
            if tempArr[i] <= tempArr[j]{
                arr[k] = tempArr[i]
                i += 1
            }else{
                arr[k] = tempArr[j]
                j += 1
            }
            k += 1
        }
        // Sometimes what happens, all elements of one array are taken out and placed in the sorted array, but few items are still lying  there in another array, so we just copy those one by one towards the end and those will be automatically sorted.
        // Those elements left there for a reason, those were larger numbers and thus left behind.
        // Always remember whose item we're picking counter will increase on their side only.
        while i <= mid {
            arr[k] = tempArr[i]
            k += 1
            i += 1
        }
        while j <= high {
            arr[k] = tempArr[j]
            k += 1
            j += 1
        }
    }
    
    
}
