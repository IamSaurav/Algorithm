//
//  AVLTree.swift
//  Algorithm
//
//  Created by 703177729 on 5/7/19.
//  Copyright © 2019 com.fsfes.frewfer. All rights reserved.
//

/*
 Introduction:
 AVL tree is a self-balancing binary search tree.
 Rules:
 (a) The difference of heights of the two child of any node should be at most one.
     When they differ by more than one, rebalancing is done to restore balancing.
     balance = height of left branch - height of right branch
     So, if difference is -1, 0 and 1 the node is called balanced
     Example 1:
          X
        /
       Y
      /
     Z
     balance of X = 2 - 0 = 2
     balance of Y = 1 - 0 = 1
     balance of Z = 0 - 0 = 0
     Example 2:
     X
      \
       Y
      /  \
     Z    X1
           \
            X2
 balance X = 0 - 3 = -3
 balance Y = 1 - 2 = -1
 balance Z = 0 - 0 = 0
 balance X1 = 0 - 1 = -1
 balance X2 = 0 - 0 = 0
 
 (b) Can't insert duplicate values.
 (c) A node can have at max two child nodes
 (d) Value of left node should be smaller than value of the parent node. Which is same as binary tree.
 (e) Value of right node should be greater than value of the parent node. Which is same as binary tree.
 
 Q: Why AVL Tree? When we have binary search tree.
 Ans: The time complexity for searching an element in AVL tree is much better compared to bst.
      Let's say we will have to search a 20 in below tree, we will have to take 3 steps to get there.
      7
       \
        10
       /  \
      8   15
           \
            20
 
     Let's convert this tree into a AVL tree and see if time complexity reduces.
     10
     / \
    8   15
   /     \
  7      20
  Now let's see how many steps to get node with value 20.
  20 is >10 so we will find in the right side, if we couldn't find in this step we will further search in it's child node.
  In next search we get the matching value of 20. So, it took 2 steps to search. This difference becomes significant in larger trees.
 Time complexity of an AVL tree is O(h) where h is height of tree, whereas in bst it can be O(n) in worst case...
 where n is the number of nodes.
 
 Extra Note (Can be ignored):
 -------------------------------------------------------------
 7
  \
   10
    \
     15
 This kind of tree called Right Skewed Tree
 
 -------------------------------------------------------------
      7
     /
    6
   /
  5
 This kind of tree called Left Skewed Tree.
 */

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
    /*
     Height of any node depends upon it's child node and specifically it depends on the last child of branch.
     Thus we take and update node's height after some operation like insertion, deletion etc.
     */
    func greaterHeight(node: Node?) -> Int {
        // Don't worry about ?? swift asks to set a default value incase any optional is null.
        let leftHeight: Int = node?.left?.height ?? 0
        let rightHeight: Int = node?.right?.height ?? 0
        return leftHeight > rightHeight ? leftHeight : rightHeight
    }
    
    func insert(data:Int) {
        insert(node: &root, data: data)
    }
    
    /*
     The steps to insert a node in AVL tree is exactly same as Binary Search Tree, except that here we need to follow two extra steps.
     1. Update the hight of the node.
     2. Re-balance the tree.
    */
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
    
    /*
     The steps to delete a node in AVL tree is exactly same as Binary Search Tree, except that here we need to follow two extra steps.
     1. Update the hight of the node.
     2. Re-balance the tree.
     */
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
    
    // Balance factor is explained above.
    // balance = height of left branch - height of right branch
    func balanceTree(node: inout Node?, data: Int) {
        if let current = node {
            // If it is not balanced then we will have to rotate to make it balanced.
            let balance = balanceFactor(node: node)
            
            // > 1 means left branch is bigger than right one. Means this node is left imbalanced and overall it is not an AVL Tree.
            // Given data (for insertion or deletion) is less than current node's data, that means..
            // it is a left skewed tree and can be right rotated. Example:
            //     7
            //    /
            //   6
            //  /
            // 5
            //-----After rotation-------
            //   6
            //  / \
            // 5   7
            // It is called LL(left left) case.
            if balance > 1 && data < (current.left?.data ?? 0) {
                node = rightRotation(node: node)
                return
            }
            // > 1 means left branch is bigger than right one. Means this node is left imbalanced and overall it is not an AVL Tree.
            // Given data (for insertion or deletion) is greater than current node's data, that means..
            // there is a node on right side as well, if we try to only right rotate it won't work. We will first left rotate
            // then right rotate, see the diagram below.
            //     7
            //    /
            //   6
            //    \
            //     5
            //-----First rotation (left rotation)-------
            //     5
            //      \
            //       6
            //        \
            //         7
            //-----Second rotation (right rotation)-------
            //     6
            //    / \
            //   5   7
            // It is called LR(left right) case.
            if balance > 1 && data > (current.left?.data ?? 0) {
                node?.left = leftRotation(node: current.left)
                node = rightRotation(node: node)
                return
            }
            // < -1 means right branch is bigger than left one. Means this node is right imbalanced and overall it is not an AVL Tree.
            // Given data (for insertion or deletion) is greater than current node's data, that means..
            // it is a right skewed tree and can be left rotated. Example:
            //     5
            //      \
            //       6
            //        \
            //         7
            //-----After rotation-------
            //   6
            //  / \
            // 5   7
            // It is called RR(right right) case.
            if balance < -1 && data > (current.left?.data ?? 0) {
                node = leftRotation(node: node)
                return
            }
            // < -1 means right branch is bigger than left one. Means this node is right imbalanced and overall it is not an AVL Tree.
            // Given data (for insertion or deletion) is smaller than current node's data, that means..
            // there is a node on left side as well, if we try to only left rotate it won't work. We will first right rotate
            // then left rotate, see the diagram below.
            //     6
            //      \
            //       8
            //      /
            //     7
            //-----First rotation (right rotation)-------
            //     8
            //    /
            //   7
            //  /
            // 6
            //-----Second rotation (left rotation)-------
            //     7
            //    / \
            //   6   8
            // It is called RL(right left) case.
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
    
    /*
    This method is extra and it has nothing to do with AVL Tree.
    This is just for practice.
    */
    func reverseTree(node: Node?) {
        if let current = node{
            let tempNode = node?.right
            node?.right = current.left
            node?.left = tempNode
            reverseTree(node: node?.left)
            reverseTree(node: node?.right)
        }
    }
    
}
