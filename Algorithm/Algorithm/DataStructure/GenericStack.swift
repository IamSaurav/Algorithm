//
//  GenericStack.swift
//  Algorithm
//
//  Created by 703177729 on 5/2/19.
//  Copyright © 2019 com.fsfes.frewfer. All rights reserved.
//

/********** INTRODUCTION **************
 It is same as the Stack class implementation, just it takes AnyObject as data and not Int.
 Implemented this for Graph. That Stack keep it simple with only Int as data.
 ********** INTRODUCTION **************/

import UIKit

class GenericStack: NSObject {
    private(set) var top: Node?
    private(set) var size: uint = 0
    
    class Node {
        var data: AnyObject?
        var prev: Node?
        class func create(data: AnyObject, prev: Node?) -> Node {
            let node = Node.init()
            node.data = data
            node.prev = prev
            return node
        }
    }
    
    func peek() -> AnyObject? {
        return top?.data
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    @discardableResult
    func push(data: AnyObject) -> AnyObject? {
        // Top node will become previous node of new node
        let node  = Node.create(data: data, prev: top)
        // New node will become the top node.
        top = node
        size += 1
        return node.data
    }
    
    @discardableResult
    func pop() -> AnyObject? {
        let data = top?.data
        // Prev node of top node will be new top node.
        top = top?.prev
        size -= size > 0 ? 1 : 0
        return data
    }
    
}
