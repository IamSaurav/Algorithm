//
//  Tree.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.fsfes.frewfer. All rights reserved.
//

import UIKit

class Tree: NSObject {
    public class Node: NSObject {
        var left: Node?
        var right: Node?
        var data: Int!
        public class func create(left: Node?, right: Node?, data: Int) -> Node {
            let node = Node.init()
            node.left = left
            node.right = right
            node.data = data
            return node
        }
    }
    var root: Node?
    
    func insert(data: Int) {
        insert(current: &root, data: data)
    }
    
    func insert(current: inout Node?, data: Int) {
        if let node = current {
            if data < node.data {
                insert(current: &node.left, data: data)
            }else{
                insert(current: &node.right, data: data)
            }
        }else{
            current = Node.create(left: nil, right: nil, data: data)
        }
    }
    
    @discardableResult
    func deleteNode(data: Int) -> Node? {
        return deleteNode(current: &root, data: data)
    }
    
    func deleteNode(current: inout Node?, data: Int) -> Node? {
        if let node = current {
            if data < node.data {
                node.left = deleteNode(current: &node.left, data: data)
            }else if data > node.data{
                node.right = deleteNode(current: &node.right, data: data)
            }else if node.left == nil {
                return node.right
            }else if node.right == nil{
                return node.left
            }else{
                let minElement = minimumElement(current: &node.right)
                current?.data = minElement?.data
                node.right = deleteNode(current: &node.right, data: (minElement?.data)!)
            }
            return current
        } else {
            return nil
        }
    }
    
    func minimumElement(current: inout Node?) -> Node? {
        if let node = current?.left{
            return minimumElement(current: &node.left)
        }else{
            return current
        }
    }
    
    func readNodes() -> [Node] {
        var nodes :[Node] = [Node].init()
        readNodes(current: &root, nodes: &nodes)
        return nodes
    }
    
    func readNodes(current: inout Node?, nodes: inout [Node]) {
        if let node = current{
            nodes.append(node)
            readNodes(current: &node.left, nodes: &nodes)
            readNodes(current: &node.right, nodes: &nodes)
        }
    }
    
    func searchNode(data: Int) -> Node {
        var node = Node.init()
        searchNode(current: &root ,data: data, node: &node)
        return node
    }
    
    func searchNode(current: inout Node?, data: Int, node: inout Node) {
        if let currentNode = current{
            if data == currentNode.data {
                node = currentNode
                return
            }
            else if data < currentNode.data {
                searchNode(current: &currentNode.left, data: data, node: &node)
            } else {
                searchNode(current: &currentNode.right, data: data, node: &node)
            }
        }
    }
}
