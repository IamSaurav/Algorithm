//
//  HeapSort.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm. All rights reserved.
//

/*
 Heap Sort:
 1. Build a Max Heap from the input data.
 2. Now the largest item is stored at the root of the heap.
 3. So we will swap the first element of the list with the final element...
     Because now first element is root node and it is the largest so it should be in the right most side of array.
 4. Now decrease the considered range(size of heap) for sorting the list by one.
 3. Repeat above steps while size of heap is greater than 1.
 
 What is Max Heap?
 A max-heap is a complete binary tree in which the value of parent node is greater than or equal to the values of it's children.
 
 What is Complete Binary Tree?
 It is a tree in which every node other than the leaves have two children.
 
 Description:
 Heapsort can be thought of as an improved selection sort, it divides its input array into a sorted and an unsorted..
 region and it iteratively shrinks the unsorted region by extracting the largest element and moving that to the sorted region.
 
 Heap Sort is an in-place algorithm.
 Q: What do mean by in-place Algorithm?
 Ans: In-place Algorithm: It doesn't need any extra data structure, like extra array, stack etc..
      It performs it's opeartion on the given input array and a bit of extra space it takes to create local variables.
 */

import UIKit

class HeapSort: NSObject {
    func heapSort(array: [Int]) -> [Int]{
        var array = array
        heapSort(array: &array)
        return array
    }
    
    // Concept is to build a max heap and then remove root node and place it at the end of array. So that node is considered a sorted. Now build max heap with rest repeatedly until 0th index.
    func heapSort(array: inout [Int]){
        // Build the max heap first to organize the array.
        // Q: Why buildMaxHeap() in two different loop?
        // Ans: Because actual job of second loop is to take the root node and by swapping, place it to the right most side of the array.
        //      Then build the Max Heap again becuse, after replacing it got disturbed.
        //      We could've called buildMaxHeap() before swaping operation also but it doesn't work when it reaches 0th index.
        // Q: Why .reversed() ?
        // Ans: As we sort the array we take the largest and park it on the right most side.
        //      Thus to leave aside those sorted values we start from last to start.
        //      This is for convenience or else we will have to keep track of index till where it sorted.
        // Q: Why array.count/2?
        // Ans: While building Max Heap out of an array, we need two children for every parent, so maximum it can reach up to count/2.
        // Q: Then why not array.count/2 in secons loop in bottom?
        // Ans: There we're not only building max heap but we are taking out the root node and placing it towards the right most side.
        //      In this process we get root node in 0'th index, so we replace it with right most element.
        //      Then again we build the max heap because it got disturbed by replacing.
        for i in (0..<array.count/2).reversed() {
            buildMaxHeap(arr: &array, sizeOfHeap: array.count, rootIndex: i)
        }
        // One by one extracts an element from heap
        // It takes the root node because it's the largest element. By rule of Max Heap root node's value will be largest.
        for i in (0..<array.count).reversed(){
            let temp = array[0]
            array[0] = array[i]
            array[i] = temp
            // Build Max Heap on the reduced heap.
            buildMaxHeap(arr: &array, sizeOfHeap: i, rootIndex: 0)
        }
    }
    
    // Aim behind creating Max Heap is to find the largest element and by rule of MAx Heap, the largest element will be the root node.
    // sizeOfHeap: It is actually the reduced
    func buildMaxHeap(arr: inout [Int], sizeOfHeap: Int, rootIndex: Int) {
        var largest = rootIndex
        // Q: What is purpose of formula 2*rootIndex + 1?
        // Ans: While creating max heap we need 2 child nodes for a parent node. Thus we take first element as parent, then..
        //      2*0+1=1. 1 is the index where we get the left child.
        //      2*0+2=2. 2 is the index where we get the right child. Similarly you can calulate and get index for others as well.
        let left = 2*rootIndex + 1
        let right = 2*rootIndex + 2
        
        if left < sizeOfHeap && arr[left] > arr[largest] {
            largest = left
        }
        if right < sizeOfHeap && arr[right] > arr[largest] {
            largest = right
        }
        
        if largest != rootIndex {
            let temp = arr[rootIndex]
            arr[rootIndex] = arr[largest]
            arr[largest] = temp
            buildMaxHeap(arr: &arr, sizeOfHeap: sizeOfHeap, rootIndex: largest)
        }
    }
}
