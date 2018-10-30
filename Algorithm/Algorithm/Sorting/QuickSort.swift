//
//  QuickSort.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm. All rights reserved.
//

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
    
    func quickSort(array: inout [Int], low: Int, high: Int){
        let pivot = array[high]
        var i = low
        var j = high
        while (i <= j) {
            while (array[i] < pivot) {
                i += 1
            }
            while (array[j] > pivot) {
                j -= 1
            }
            if i <= j {
                let temp = array[i]
                array[i] = array[j]
                array[j] = temp
                i += 1
                j -= 1
            }
        }
        if low < j {
            quickSort(array: &array, low: low, high: j)
        }
        if high > i {
            quickSort(array: &array, low: i, high: high)
        }
    }
    
}
