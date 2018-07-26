//
//  Queue.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.fsfes.frewfer. All rights reserved.
//

import UIKit

class Queue {
    
    private (set) var head: Node?
    private (set) var tail: Node?
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
        return head?.data
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    func enque(data: Int) {
        let node = Node.create(data: data, next: nil)
        if tail == nil{
            head = node
            tail = node
        }else{
            tail?.next = node
            tail = node
        }
        size += 1
    }
    
    @discardableResult
    func deque() -> Int? {
        if head == nil{
            return nil
        }
        let data = head?.data
        head = head?.next
        if head == nil{
            tail = nil
        }
        size -= size > 0 ? 1 : 0
        return data
    }
    


}
