//
//  ViewController.swift
//  Algorithm
//
//  Created by 703177729 on 13/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let unsortedArray: [Int] = [-1,0,1,2,3,4,5]
        let sortedArray = SelectionSort.init().selectionSort(unsortedArray)
    }


}

