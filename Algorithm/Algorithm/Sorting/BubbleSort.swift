//
//  BubbleSort.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.fsfes.frewfer. All rights reserved.
//

import UIKit

class BubbleSort: NSObject {
    func bubbleSort(arr:[Int]) -> [Int] {
        if arr.count < 1{
            return arr
        }
        var arr = arr
        for i in 0..<arr.count-1 {
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
