//
//  GenericQueue.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 02/05/19.
//  Copyright © 2019 com.fsfes.frewfer. All rights reserved.
//

import UIKit

class GenericQueue {
    private (set) var first: Node?
    private (set) var last: Node?
    private (set) var size: uint = 0
    
    class Node {
        var data: AnyObject?
        var next: Node?
        class func create(data: AnyObject, next: Node?) -> Node {
            let node = Node.init()
            node.data = data
            node.next = next
            return node
        }
    }
    
    func peek() -> AnyObject? {
        return first?.data
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    func enque(data: AnyObject) {
        let node = Node.create(data: data, next: nil)
        if first == nil{
            first = node
            last = node
        }else{
            // Current last node's next will be the new last.
            last?.next = node
            // This new node will become the last node.
            last = node
        }
        size += 1
    }
    
    @discardableResult
    func deque() -> AnyObject? {
        // Keeps the data, just to return after deletion.
        let data = first?.data
        if first != nil {
            first = first?.next
            last = first == nil ? nil: last
            size -= 1
        }
        return data
    }
}
