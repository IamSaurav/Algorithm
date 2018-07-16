//
//  CircularLinkedList.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.fsfes.frewfer. All rights reserved.
//

import UIKit

class CircularLinkedList: NSObject {
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
    
    func count() -> Int{
        if head == nil {
            return 0
        }
        var current = head
        var nodeCounter = 0
        while current?.next != nil && head != current?.next {
            nodeCounter += 1
            current = current?.next
        }
        nodeCounter += 1
        return nodeCounter
    }
    
    func lastNode() -> Node? {
        var slow = head
        var fast = head
        while slow != nil && fast != nil {
            if slow?.next == fast?.next?.next{
                return slow
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return nil
    }
    
    // Floyd's circular/loop detection algo
    func isCircular() -> Bool {
        var slow = head
        var fast = head
        while slow != nil && fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
            if slow == fast {
                return true
            }
        }
        return false
    }
    
    func readAll() -> [Node] {
        if head == nil{
            return []
        }
        var current = head
        var nodes = [Node].init()
        while current?.next != head {
            nodes.append(current!)
            current = current?.next
        }
        nodes.append((current)!)
        return nodes
    }
    
    func insert(data: Int) {
        let node = Node.create(data: data, next: nil)
        if head == nil{
            head = node
            node.next = head
        }else{
            let last = lastNode()
            last?.next = node
            node.next = head
        }
    }
    
    func delete(data: Int) {
        if head == nil {
            return
        }
        var current = head
        var prev = head
        while current?.data != data && current?.next != head {
            prev = current
            current = current?.next
        }
        if current?.data != data{
            return
        }
        if current == head && head?.next == head {
            head = nil
        } else if current == head && current?.next != nil {
            let last = lastNode()
            head = current?.next
            last?.next = head
        } else{
            prev?.next = current?.next
        }
    }
}
