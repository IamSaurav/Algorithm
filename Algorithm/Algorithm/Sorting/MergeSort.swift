//
//  MergeSort.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm. All rights reserved.
//
/*
 Idea:
 Divide the unsorted list into sublists, each containing single element. By rule single element array is sorted.
 Take adjacent single element lists comapre and merge them. Repeat the process till a single sorted list of obtained.
 
 
 Description:
 Merge Sort is a Divide and Conquer algorithm. It divides input array in two halves,
 sorts the two halves and merges the sorted halves.
 
 
 */

import UIKit

class MergeSort: NSObject {
    
    func mergeSort(array: [Int]) -> [Int]{
        var array = array
        mergeSort(arr: &array, low: 0, high: array.count-1)
        return array
    }
    
    func mergeSort(arr: inout [Int], low: Int, high: Int) {
        if(low < high)
        {
            let mid = (low + high) / 2;
            mergeSort(arr: &arr, low: low, high: mid)
            mergeSort(arr: &arr, low: mid + 1, high: high)
            merge(arr: &arr, low: low, mid: mid, high: high)
        }
    }
    
    // Q: Why name Merge() when it comapres also?
    // Ans: Merge is actually an algorithm. It takes sorted lists as input and produce a single list as output in sorted order.
    func merge(arr: inout [Int], low: Int, mid: Int, high: Int) {
        var tempArr: [Int] = arr
        var i = low
        var k = low
        var j = mid + 1
        
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
