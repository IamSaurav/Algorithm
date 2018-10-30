//
//  SelectionSort.swift
//  Algorithm
//
//  Created by 703177729 on 13/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm. All rights reserved.
//

import UIKit

public class SelectionSort {
    
    public func selectionSort<T: Comparable> (_ arr: [T]) -> [T] {
        var arr = arr
        for i in 0..<arr.count {
            var swapIndex = i
            for j in i+1..<arr.count{
                if arr[j] < arr[swapIndex]{
                    swapIndex = j
                }
            }
            let temp = arr[swapIndex]
            arr[swapIndex] = arr[i]
            arr[i] = temp
        }
        return arr
    }
    
}
