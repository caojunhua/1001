//
//  xiapi10.swift
//  ForDreams
//
//  Created by cao hua on 2022/6/22.
//

import Foundation

/**
 // 中序: 左- 根 - 右
 // 后序: 左- 右 - 根
 举例:
 ----------------------------------
          3
    1                       2
 4            5          6              7
 // 中序:   [4, 1,  5,  3, 6, 2, 7] --> 记录到字典: [[4: 0], [1: 1], [5: 2],[3: 3],[6: 4],[2: 5],[7: 6]]
 //  后序:  [4, 5, 1, 6,   7,   2, 3]
 
 对后序数组,从后往前
 0. curIndex = 6
 1. 当取3的时候, index =>  dict[3] = 3 , 把curIndex = 5
 2.那么当前根节点的后继节点, 为index + 1 = 4
   那么当前根节点的前驱节点, 为index - 1 = 2
 3. 先求当前根节点右边 , 再求左边,递归调用
 4. 当left > right 不符合
 
 5. 其中第二步,递归进来的时候,参数左为4,参数右为6
 rootVal = 2
 rootNode = TreeNode(rootVal)
 新的根节点为 2, 从字典中取index --> dict[2] = 5, 把curIndex = 4
 右边值: TreeNode(7)  left = (index + 1) == 6, right =  6
 左边值: TreeNode(6) left = 4, right = (curIndex - 1) == 4
 
 ------------------
 总结:
 1. 中序遍历用来生成字典
 2. 后序遍历,从后往前,生成右,左节点,递归调用
 */
class xiapi10 {
    var myPostorder = [Int]()
    var curIndex = 0
    var dict = [Int: Int]()
    
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode10? {
        myPostorder = postorder
        curIndex = myPostorder.count - 1
        
        for index in 0..<inorder.count {
            dict[inorder[index]] = index
        }
        
        return getNodeByLeftAndRight(0, myPostorder.count - 1)
        
    }
    
    func getNodeByLeftAndRight(_ left: Int, _ right: Int) -> TreeNode10? {
        if left > right {
            return nil
        }
        
        let rootVal = myPostorder[curIndex]
        let rootNode = TreeNode10(rootVal)
        
        guard let index = dict[rootVal] else {
            return nil
        }
        curIndex -= 1
        rootNode.right = getNodeByLeftAndRight(index + 1, right)
        rootNode.left = getNodeByLeftAndRight(left, index - 1)
        
        return rootNode
    }
    
}

/**
 二叉树节点
 */
class TreeNode10 {
    var val: Int
    var left: TreeNode10?
    var right: TreeNode10?
    
    init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    init(_ val: Int, _ left: TreeNode10?, _ right: TreeNode10?) {
        self.val = 0
        self.left = left
        self.right = right
    }
    
}
