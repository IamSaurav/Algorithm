//
//  LinkedList.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.fsfes.frewfer. All rights reserved.
//

import UIKit

class LinkedList: NSObject {
    
    private (set) var head: Node?
    private (set) var size: uint = 0
    
    class Node {
        var data: Int?
        var prev: Node?
        var next: Node?
        
        class func create(data: Int) -> Node {
            let node = Node.init()
            node.data = data
            return node
        }
    }
    
    func isEmpty() -> Bool {
        return size > 0
    }
    
    func insert(data: Int) {
        let node = Node.create(data: data)
        if head == nil{
            head = node
            head?.prev = node
            head?.next = node
        }else{
            head = node
            head?.prev = node
            head?.next = node
        }
    }
    
    func delete(data: Int) {
        
    }
    
    
    
    
}
