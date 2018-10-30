//
//  HeapSort.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm. All rights reserved.
//

import UIKit

class HeapSort: NSObject {
    func heapSort(array: [Int]) -> [Int]{
        var array = array
        heapSort(array: &array)
        return array
    }
    
    //Concept is to build a max heap and then remove root node and place it at the end of array. So that node is considered a sorted. Now build max heap with rest repeatedly until 0th index.
    func heapSort(array: inout [Int]){
        // Maximum it can reach up to count/2. Because every node divided into two child node So, by the time it reaches half of array it will be finished.
        // Always start from 0 to n. Because it is a bottom up approach to create max heap.
        for i in (0..<array.count/2).reversed() {
            buildMaxHeap(arr: &array, n: array.count, i: i)
        }
        
        
        // it takes the root node which is first node and replacing at end which i because it starts from last or array.count.
        // Once taken out the root node it doesn't discturb it because it creats the max heap with rest of items of array, ehich is i..0
        for i in (0..<array.count).reversed(){
            let temp = array[0]
            array[0] = array[i]
            array[i] = temp
            buildMaxHeap(arr: &array, n: i, i: 0)
        }
    }
    
    // Here we will create a max heap. There is no benefit in creating normal heap (or binary tree), because ultimately it doesn't change the order of the array items.
    func buildMaxHeap(arr: inout [Int], n: Int, i: Int) {
        var largest = i
        let l = 2*i + 1
        let r = 2*i + 2
        
        
        if l < n && arr[l] > arr[largest] {
            largest = l
        }
        
        
        if r < n && arr[r] > arr[largest] {
            largest = r
        }
        
        
        if largest != i {
            let temp = arr[i]
            arr[i] = arr[largest]
            arr[largest] = temp
            buildMaxHeap(arr: &arr, n: n, i: largest)
        }
    }
}
