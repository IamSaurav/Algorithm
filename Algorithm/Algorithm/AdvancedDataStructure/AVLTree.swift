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
    */
    func rightRotation(node: inout Node?) -> Node? {
        let left = node?.left
        let rightOfLeft = left?.right
        left?.right = node
        // Sometime what happens root node may have some right nodes,
        node?.left = rightOfLeft
        
        // ToDo Update heights
        node?.height = (node?.left?.height ?? 0) > (node?.right?.height ?? 0) ? node?.left?.height : node?.right?.height
        left?.height = (node?.left?.height ?? 0) > (node?.right?.height ?? 0) ? node?.left?.height : node?.right?.height
        return left
    }
    
    /*
     When the node is right imbalanced, we rotate towards left.
     */
    func leftRotation(node: inout Node?) {
        
    }
    
    
    
    
    func insert(node: inout Node?, data:Int)
    {
        if let current = node{
            
            
            
        }else{
            node = Node.create(left: nil, right: nil, data: data, height: 1)
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
