//
//  LinkedList.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm All rights reserved.
//

/********** INTRODUCTION **************
 LinkedLists are of three types Singly, Doubly, Circular.
 Elements can be added anywhere, but generally at end.
 Elements can be removed from anywhere, but generally from end.
 ********** INTRODUCTION **************/


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
            node.prev = prev
            node.next = next
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
            //To find the last node we keep visiting all node till we find a node with no next node.
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
        //To find node to delete, we search for a node with matching data till the last node.
        while current?.next != nil && current?.data != data {
            current = current?.next
        }
        let headData = current?.data
        // Q: current?.prev?.next ultimately is current node, isn't it? :D :D
        // Ans: No it is not, we have to assign next node reference of previous node to nil.
        // Q: Wait but you are not assigning nil, why?
        // Ans: Well we are assigning nil in cases where you are trying to delete the last node. But what about a node in the middle you want to delete, in that case we will have to assign the very next node to previous node by eleminating the current node.
        current?.prev?.next = current
        size -= size > 0 ? 1: 0
        return headData
    }
    
}
