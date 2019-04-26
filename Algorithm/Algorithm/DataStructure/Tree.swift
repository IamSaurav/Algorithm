//
//  Tree.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm. All rights reserved.
//

/********** INTRODUCTION **************
 Tree is a non-linear data structure, because it's nodes connects to multile node.
 In general tree each node can have infinite number of children.
 In Binary tree each node has at most two nodes left and right, we have implemented binary tree below.
 The topmost node is called root of the tree.
 The nodes directly connected called its children.
 Use case-file system on a computer.
 ********** INTRODUCTION **************/

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
    func deleteNode(data: Int) -> Int? {
        delete(current: &root, data: data)
        return data
        
        /*
         Either create a local copy of root to pass to the delete method or pass the root itself.
         If copy of of root passed then it needs to be assigned back to root after delete method execution.
         Because while deleting when there is only one node left and that that is root node, you can delete all the references but root node will not become null.
         
         var current = root
         delete(current: &current, data: data)
         root = current
         return current?.data
         */
    }
    
    func minimumElement(current: inout Node?) -> Node? {
        if var node = current {
            while node.left != nil {
                node = node.left!
            }
            return node
        }
        return current
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
    
    /*
     Logic: We need to find the a node by iterating the tree, with data same as data to be deleted.
     There can three scenario, data is equal, smaller or greater than the current node.
    */
    func delete(current: inout Node?, data: Int)  {
        // If root node is null then nothing to delete.
        if let node = current {
            if data < node.data{
                delete(current: &node.left, data: data)
            }else if data > node.data{
                delete(current: &node.right, data: data)
            }else{
                if node.left == nil && node.right == nil{
                    current = nil
                }else if node.left == nil {
                    current = node.right
                }else if node.right == nil {
                    current = node.left
                }else{
                    let data = minimumElement(current: &node.right)?.data
                    current?.data = data
                    delete(current: &node.right, data: data!)
                }
            }
        }
    }
    
    
    
    
}
