//
//  Queue.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.fsfes.frewfer. All rights reserved.
//

import UIKit

class Queue: NSObject {
    var head: Node?
    var tail: Node?
    var size: Int = 0
    
    public class Node: NSObject {
        var data: Any!
        var next: Node?
        
        public class func create(data: Any, next: Node?) -> Node {
            let node = Node.init()
            node.next = next
            node.data = data
            return node
        }
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    // Returns value of first element without dequeing it.
    func peek() -> Any? {
        return head?.data
    }
    
    // Returns value of first element without dequeing it.
    func poll() -> Any? {
        if let top = head {
            return dequeue(node: top)
        }
        return nil
    }
    
    func enqueue(data: Any) {
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
    
    func dequeue(node: Node) -> Any? {
        if head == nil{
            return nil
        }
        let data = head?.data
        head = head?.next
        if head == nil{
            tail = nil
        }
        size -= 1
        return data
    }
}
