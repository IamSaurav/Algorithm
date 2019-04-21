//
//  Queue.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm. All rights reserved.
//

/********** INTRODUCTION **************
 Queue is a linear data structure.
 Elements will be added in end.
 Elements will be removed from start.
 FIFO - opertion
 Insertion operation called Enque
 Deletion operation called Deque
 Getting data of first element is called - Peek
 ********** INTRODUCTION **************/


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
            // Current last node's next will be the new last.
            last?.next = node
            // This new node will become the last node.
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
