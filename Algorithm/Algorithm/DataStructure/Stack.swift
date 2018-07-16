//
//  Stack.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.fsfes.frewfer. All rights reserved.
//

import UIKit

class Stack: NSObject {
    var top: Node?
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
        return top == nil
    }
    
    // Returns value of first element without dequeing it.
    func peek() -> Any? {
        return top?.data
    }
    
    func push(data: Any) {
        let node = Node.create(data: data, next: top)
        top = node
        size += 1
    }
    
    @discardableResult
    func pop() -> Any? {
        let data = top?.data
        top = top?.next
        size -= 1
        return data
    }
}
