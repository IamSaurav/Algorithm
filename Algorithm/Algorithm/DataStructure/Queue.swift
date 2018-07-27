//
//  Queue.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.fsfes.frewfer. All rights reserved.
//

import UIKit

class Queue {
    
    private (set) var first: Node?
    private (set) var last: Node?
    private (set) var size: uint = 0
    
    class Node {
        var data: Int?
        var next: Node?
        class func create(data: Int, next: Node?) -> Node {
            let node = Node.init()
            node.data = data
            node.next = next
            return node
        }
    }
    
    func peek() -> Int? {
        return first?.data
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    func enque(data: Int) {
        let node = Node.create(data: data, next: nil)
        if first == nil{
            first = node
            last = node
        }else{
            last?.next = node
            last = node
        }
        size += 1
    }
    
    @discardableResult
    func deque() -> Int? {
        let data = first?.data
        if first == nil{
            last = nil
        }else{
            first = first?.next
        }
        size -= size > 0 ? 1 : 0
        return data
    }
    


}
