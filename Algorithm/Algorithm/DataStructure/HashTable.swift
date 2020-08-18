//
//  HashTable.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm. All rights reserved.
//

import UIKit

class HashTable: NSObject {
    var nodes = [Node].init()
    var size: Int = 0
    var maxSize: Int = 10
    
    override init() {
        for _ in 0...maxSize {
            nodes.append(Node.init())
        }
    }
    
    public class Node {
        var key: String?
        var value: Int?
        var next: Node?
        public class func create(k: String, v: Int, n: Node?) -> Node {
            let node = Node.init()
            node.key = k
            node.value = v
            node.next = n
            return node
        }
    }
    
    func isEmpty() -> Bool {
        return size <= 0
    }
    
    func findIndex(key: String) -> Int {
        return key.hashValue % maxSize
    }
    
    func valueFor(key: String) -> Int? {
        let index = findIndex(key: key)
        var node: Node? = nodes[index]
        while node != nil {
            if node?.key == key{
                return node?.value
            }
            node = node?.next
        }
        return nil
    }
    
    func put(key: String, value: Int) {
        let index = findIndex(key: key)
        var node: Node? = nodes[index]
        while node != nil {
            if node?.key == key {
                node?.value = value
                return
            }
            node = node?.next
        }
        size += 1
        node = nodes[index]
        nodes[index] = Node.create(k: key, v: value, n: node)
        let currenttableSize = Double(size)/Double(maxSize)
        if currenttableSize >= 0.7 {
            increaseHashTableSize(by: 2)
        }
    }
    
    func increaseHashTableSize(by: Int) {
        let tempNodes = nodes
        nodes.removeAll()
        maxSize = maxSize * by
        size = 0
        for _ in 0..<maxSize {
            nodes.append(Node.init())
        }
        
        for node in tempNodes {
            var cNode: Node? = node
            while cNode?.key != nil{
                put(key: (cNode?.key)!, value: (cNode?.value)!)
                cNode = cNode?.next
            }
        }
    }
    
    func HashKey(value: String) -> String {
        var constnt = 33
        for (index, char) in value.characters.enumerated() {
            let index = ((Int)char) % 32;
            constnt += index^position
        }
    }
    
    func remove(key: String) {
        let index = findIndex(key: key)
        var node: Node? = nodes[index]
        var prev: Node?
        while node != nil {
            if node?.key == key {
                break
            }
            prev = node
            node = node?.next
            if node != nil{
                size -= 1
            }
            
            if prev != nil{
                prev?.next = node?.next
            }else{
                nodes[index] = (node?.next)!
            }
        }
    }
}
