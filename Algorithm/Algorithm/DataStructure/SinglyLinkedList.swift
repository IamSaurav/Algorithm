//
//  SinglyLinkedList.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm. All rights reserved.
//

import UIKit

class SinglyLinkedList: NSObject {
    var head: Node?
    
    public class Node: NSObject {
        var next: Node?
        var data: Int!
        public class func create(data: Int, next: Node?) -> Node {
            let node = Node.init()
            node.next = next
            node.data = data
            return node
        }
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
    
    func insert(data: Int) {
        if head == nil{
            head = Node.create(data: data, next: nil)
        }else{
            var current = head
            while current?.next != nil {
                current = current?.next
            }
            current?.next = Node.create(data: data, next: nil)
        }
    }
    
    func delete(data: Int) {
        if head != nil && head?.data == data{
            head = head?.next
            return
        }
        var current = head
        var prev: Node?
        while current != nil && current?.data != data {
            prev = current
            current = current?.next
        }
        prev?.next = current?.next
    }
}
