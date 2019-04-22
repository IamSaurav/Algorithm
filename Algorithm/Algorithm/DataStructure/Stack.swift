//
//  Stack.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm All rights reserved.
//

/********** INTRODUCTION **************
 Stack is a linear data structure.
 Data will be added only in end.
 Data will be removed only from end.
 LIFO - opertion
 Insertion operation called Push
 Deletion operation called Pop
 Getting data of first element is called - Peek
 ********** INTRODUCTION **************/

import UIKit

class Stack {
    private(set) var top: Node?
    private(set) var size: uint = 0
    
    class Node {
        var data: Int?
        var prev: Node?
        class func create(data: Int, prev: Node?) -> Node {
            let node = Node.init()
            node.data = data
            node.prev = prev
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
        // Top node will become previous node of new node
        let node  = Node.create(data: data, prev: top)
        // New node will become the top node.
        top = node
        size += 1
        return node.data
    }

    @discardableResult
    func pop() -> Int? {
        let data = top?.data
        // Prev node of top node will be new top node.
        top = top?.prev
        size -= size > 0 ? 1 : 0
        return data
    }
    
}
