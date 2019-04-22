//
//  Stack.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm All rights reserved.
//

import UIKit

class Stack {
    private(set) var top: Node?
    private(set) var size: uint = 0
    
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
        return top?.data
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    @discardableResult
    func push(data: Int) -> Int? {
        let node  = Node.create(data: data, next: top)
        top = node
        size += 1
        return node.data
    }
    
    @discardableResult
    func pop() -> Int? {
        let data = top?.data
        top = top?.next
        size -= size > 0 ? 1 : 0
        return data
    }
    
}
