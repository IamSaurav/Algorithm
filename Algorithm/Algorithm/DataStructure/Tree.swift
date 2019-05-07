//
//  Tree.swift
//  Algorithm
//
//  Created by Saurav Satpathy on 17/07/18.
//  Copyright © 2018 com.bitMountn.Algorithm. All rights reserved.
//

/********** INTRODUCTION **************
 Tree is a non-linear data structure, because it's nodes connects to multiple node.
 In general tree each node can have infinite number of children.
 In Binary tree each node has at most two nodes left and right, we have implemented binary tree below.
 Left child node must be smaller than parent node.
 Right child node must be greater than parent node.
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
        /*
         Either create a local copy of root to pass to the insert method or pass the root itself.
         If copy of of root passed then it needs to be assigned back to root after insert method execution.
         Because while inserting you can insert to local copy but not to the root.
         var current = root
         insert(current: &current, data: data)
         root = current
         return current?.data
         */
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
    func delete(data: Int) -> Int? {
        /*
         Either create a local copy of root to pass to the delete method or pass the root itself.
         If copy of of root passed then it needs to be assigned back to root after delete method execution.
         Because while deleting when there is only one node left and that that is root node, you can delete all the references but root node will not become null.
         
         var current = root
         delete(current: &current, data: data)
         root = current
         return current?.data
         */
        delete(current: &root, data: data)
        return data
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
     To delete, first we need to find the node which has the same data, by iterating the tree.
     There can be three scenarios while iterating, data is equal, smaller or greater.
     If data is smaller, then we will probably find that node in left side.
     If data is greater, then we will probably find that node in right side.
     If data is same, then simply we cannot delete, we still need to do some operation. There can be children of this node,
        and if you simply delete that node by assigning nil then all of it's children will be lost. Also binary tree has a rule..
        data of left child should be smaller and data of right child should be greater than the parent node.
     If data is same and it is a leaf node(a node with no children), then just delete by assigning nil and you're done.
     If data is same and it has one child on left, then make that child as parent by replacing and you're done.
     If data is same and it has one child on right, then make that child as parent by replacing and you're done.
     If data is same and it has both the children, then find a node with smallest data on right side, assign it's data to
         current node then delete that smallest node.
         Q.Why smallest?
         Ans: Two reasons.
            1.Smallest will always be leaf node, then it becomes easy to delete. just assign nil.
            2. Right chlid's value will be greater than this one, which is rule for binary tree.
         Q.Why only on right side? why not left?
         Ans: Because if you make smallest node of left side as parent, then left child's value may be greater which is against rule.
         Q. Why replace data?
         Ans: By replacing data we keep it's references, which is with it's children and parent. Also after assigning data
             we get a leaf node to delete which is simple.
         Q.Why don't you assign nil immdeiately after replacing? Why recursion again?
         Ans: Just to avoid duplicate code, we have already written a line to delete a node.
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
                    let minData = minimumElement(current: &node.right)?.data
                    current?.data = minData
                    delete(current: &node.right, data: minData!)
                }
            }
        }
    }
    
    
    /*
     In Order Traversal first prints left then root then right.
     nodes: this parameter is not important, I have just used to return the data for unit test.
    */
    func inOrderTraverse(n: Node?, nodes: inout [Int]){
        if let node = n {
            inOrderTraverse(n: node.left, nodes: &nodes)
            print(node.data)
            nodes.append(node.data)
            inOrderTraverse(n: node.right, nodes: &nodes)
        }
    }

    /*
     In Order Traversal first prints root then left then right.
     nodes: this parameter is not important, I have just used to return the data for unit test.
     */
    func preOrderTraverse(n: Node?, nodes: inout [Int]){
        if let node = n {
            print(node.data)
            nodes.append(node.data)
            preOrderTraverse(n: node.left, nodes: &nodes)
            preOrderTraverse(n: node.right, nodes: &nodes)
        }
    }
    
    /*
     Post Order Traversal first prints left then right then root.
     nodes: this parameter is not important, I have just used to return the data for unit test.
     */
    func postOrderTraverse(n: Node?, nodes: inout [Int]){
        if let node = n {
            postOrderTraverse(n: node.left, nodes: &nodes)
            postOrderTraverse(n: node.right, nodes: &nodes)
            print(node.data)
            nodes.append(node.data)
        }
    }

    
    
    
}
