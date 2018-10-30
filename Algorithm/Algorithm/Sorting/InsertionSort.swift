//
//  InsertionSort.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm. All rights reserved.
//

import UIKit

class InsertionSort: NSObject {
    func insertionSort(array: [Int]) -> [Int] {
        var array = array
        insertionSort(arr: &array)
        return array
    }
    
    func insertionSort(arr: inout [Int]) {
        if arr.count < 1{
            return
        }
        for i in 1..<arr.count {
            let current = arr[i]
            var j = i - 1
            while j >= 0 && current < arr[j] {
                arr[j+1] = arr[j]
                j -= 1
            }
            arr[j+1] = current
        }
    }
}
