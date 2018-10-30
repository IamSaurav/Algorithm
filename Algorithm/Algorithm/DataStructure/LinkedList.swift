//
//  LinkedList.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm All rights reserved.
//

import UIKit

class LinkedList: NSObject {
    
    private (set) var head: Node?
    private (set) var size: uint = 0

    class Node {
        var data: Int?
        var prev: Node?
        var next: Node?
        
        class func create(data: Int, prev: Node?, next: Node?) -> Node {
            let node = Node.init()
            node.data = data
            return node
        }
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    func insert(data: Int) {
        if head == nil{
            head = Node.create(data: data, prev: nil, next: nil)
        }else{
            var current = head
            while current?.next != nil{
                current = current?.next
            }
            current?.next = Node.create(data: data, prev: head, next: nil)
        }
        size += 1
    }
    
    @discardableResult
    func delete(data: Int) -> Int? {
        var current = head
        while current?.next != nil && current?.data != data {
            current = current?.next
        }
        let headData = current?.data
        current?.prev?.next = current
        size -= size > 0 ? 1: 0
        return headData
    }
    
    
    
    
    
}
