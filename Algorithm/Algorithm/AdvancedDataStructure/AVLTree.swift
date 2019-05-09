//
//  AVLTree.swift
//  Algorithm
//
//  Created by 703177729 on 5/7/19.
//  Copyright © 2019 com.fsfes.frewfer. All rights reserved.
//

import UIKit

class AVLTree: NSObject {
    
    public class Node: NSObject {
        var left: Node?
        var right: Node?
        var data: Int!
        var height: Int!
        public class func create(left: Node?, right: Node?, data: Int, height: Int) -> Node {
            let node = Node.init()
            node.left = left
            node.right = right
            node.data = data
            node.height = height
            return node
        }
    }
    
    var root: Node?
    
    func balanceFactor(node: Node?) -> Int {
        if  node == nil{
            return 0
        }else{
            return (node?.left?.height ?? 0) - (node?.right?.height ?? 0)
        }
    }
    
    /*
     When the node is left imbalanced, we rotate towards right.
     X
     /
     Y
     /
     Z
     Steps:
     1. Set right link of left node of current node as current node.
     2. Set left link of current node as right node of left node of current node.
     Why? In some cases there may be right node of Y which we have to take care.
     And if we assign left node of current node as Right node of Y rule wise there will not be any problem,
     because value of X will be greater anyway.
     */
    @discardableResult
    func rightRotation(node: Node?) -> Node? {
        // We need to keep the reference of these nodes, because while replacing we loose reference.
        let left = node?.left
        let rightOfLeft = node?.left?.right
        
        // Actual right-rotation happens here.
        node?.left?.right = node
        node?.left = rightOfLeft
        
        // We need to update the height after rotation, it's height has to increase by 1 plus it's child's height
        node?.height = greaterHeight(node: node) + 1
        node?.left?.height = greaterHeight(node: node?.left) + 1
        return left
    }
    
    /*
     When the node is rigt imbalanced, we rotate towards left.
     X
     \
     Y
     \
     Z
     Steps:
     1. Set left link of left node of current node as current node.
     2. Set right link of current node as left node of right node of current node.
     Why? In some cases there may be right node of Y which we have to take care.
     And if we assign left node of current node as left node of Y rule wise there will not be any problem,
     because value of X will be greater anyway.
     */
    @discardableResult
    func leftRotation(node: Node?) -> Node? {
        // We need to keep the reference of these nodes, because while replacing we loose references.
        let right = node?.right
        let leftOfRight = node?.right?.left
        
        // Actual left-rotation happens here.
        right?.left = node
        node?.right = leftOfRight
        
        // We need to update the height after rotation, it's height has to increase by 1 plus it's child's height
        node?.height = greaterHeight(node: node) + 1
        right?.height = greaterHeight(node: right) + 1
        return right
    }
    
    func greaterHeight(node: Node?) -> Int {
        // Don't worry about ?? swift asks to set a default value incase any optional is null.
        let leftHeight: Int = node?.left?.height ?? 0
        let rightHeight: Int = node?.right?.height ?? 0
        return leftHeight > rightHeight ? leftHeight : rightHeight
    }
    
    func insert(data:Int) {
        insert(node: &root, data: data)
    }
    
    func insert(node: inout Node?, data:Int) {
        if let current = node {
            if data < current.data {
                insert(node: &current.left, data: data)
            }else if data > current.data {
                insert(node: &current.right, data: data)
            }else{
                return // If the same data available then just return, because duplicate keys not allowed
            }
            
            // After inserting, height needs to be updated.
            node?.height = greaterHeight(node: node) + 1
            
            balanceTree(node: &node, data: data)
            
        }else{
            node = Node.create(left: nil, right: nil, data: data, height: 1)
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
        delete(node: &root, data: data)
        return data
    }
    
    func delete(node: inout Node?, data:Int) {
        if let current = node{
            if data < current.data{
                delete(node: &current.left, data: data)
            }else if data > current.data{
                delete(node: &current.right, data: data)
            }else{
                if node?.left == nil && node?.right == nil{
                    node = nil
                }else if node?.left != nil{
                    node = node?.left
                }else if node?.right != nil{
                    node = node?.right
                }else{
                    let minimumData = minimumElement(current: &node)?.data
                    node?.data = minimumData
                    delete(node: &current.right, data: minimumData!)
                }
            }
            
            // After inserting, height needs to be updated.
            node?.height = greaterHeight(node: node) + 1
            
            balanceTree(node: &node, data: data)
        }
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
    
    func balanceTree(node: inout Node?, data: Int) {
        if let current = node {
            // Now we need to check the balance factor of new node.
            // If it is not balanced then we will have to rotate to make it balanced.
            let balance = balanceFactor(node: node)
            
            // balance facotor = left height - right height
            // > 1 means left branch is bigger.
            //
            if balance > 1 && data < (current.left?.data ?? 0) {
                node = rightRotation(node: node)
                return
            }
            // > 1 means left branch is bigger.
            //
            if balance > 1 && data > (current.left?.data ?? 0) {
                node?.left = leftRotation(node: current.left)
                node = rightRotation(node: node)
                return
            }
            // < -1 means right branch is bigger.
            //
            if balance < -1 && data > (current.left?.data ?? 0) {
                node = leftRotation(node: node)
                return
            }
            // < -1 means right branch is bigger.
            //
            if balance < -1 && data < (current.right?.data ?? 0) {
                node?.right = rightRotation(node: current.right)
                node = leftRotation(node: node)
                return
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
