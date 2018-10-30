//
//  DoublyLinkedList.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm. All rights reserved.
//

import UIKit

class DoublyLinkedList: NSObject {
    var head: Node?
    
    public class Node: NSObject {
        var next: Node?
        var prev: Node?
        var data: Int!
        public class func create(data: Int, prev: Node?, next: Node?) -> Node {
            let node = Node.init()
            node.next = next
            node.prev = prev
            node.data = data
            return node
        }
    }
    
    func count() -> Int{
        var current = head
        var nodeCounter = 0
        while current != nil {
            nodeCounter += 1
            current = current?.next
        }
        return nodeCounter
    }
    
    // Floyd's circular/loop detection algo
    func isCircular() -> Bool {
        var slow = head
        var fast = head
        while slow != nil && fast != nil && fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow == fast{
                return true
            }
        }
        return false
    }
    
    func readAll() -> [Node] {
        var current = head
        var nodes = [Node].init()
        while current != nil {
            nodes.append(current!)
            current = current?.next
        }
        return nodes
    }
    
    func delete(data: Int) {
        if head != nil && head?.data == data{
            head = head?.next
            head?.prev = nil
            return
        }
        var current = head
        while current != nil && current?.data != data {
            current = current?.next
        }
        current?.prev?.next = current?.next
    }
    
    func insert(data: Int) {
        if head == nil{
            head = Node.create(data: data, prev: nil, next: nil)
        }else{
            var current = head
            while current?.next != nil {
                current = current?.next
            }
            current?.next = Node.create(data: data, prev: current, next: nil)
        }
    }
}
