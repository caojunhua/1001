//
//  Facebook09.swift
//  ForDreams
//
//  Created by cao hua on 2022/7/22.
//

import Foundation

/**
 思路:
 1. 从上往下 BFS
 2. 从左往右 DFS
 */
/**
 代码讲解:
 0. 定义一个字典,存放每一列的结果 [key: Value] = [Int: [Int]]
 1. 定义一个队列,存放node
 2. 定义一个队列,存放位置
 3. 每次取出队列,更新字典的key - Value
 4. 遍历字典的value,从左往右遍历,放入res
 */
class Facebook09 {
    func verticalOrder(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        if root == nil { return res }
        
        var dict: [Int: [Int]] = [Int: [Int]]()
        
        var queueValue = [TreeNode]()
        if let root = root {
            queueValue.append(root)
        }
        
        var queuePosition = [Int]()
        queuePosition.append(0)
        
        var leftPos = Int.max
        
        while !queueValue.isEmpty {
            let node = queueValue.removeFirst()
            let pos = queuePosition.removeFirst()
            
            var subArr = dict[pos, default: [Int]()]
            subArr.append(node.val)
            dict[pos] = subArr
            
            if node.left != nil {
                queueValue.append(node.left!)
                queuePosition.append(pos - 1)
            }
            
            if node.right != nil {
                queueValue.append(node.right!)
                queuePosition.append(pos + 1)
            }
            
            leftPos = min(leftPos, pos)
        }
        
        for i in leftPos..<leftPos + dict.count {
            if let subArr = dict[i] {
                res.append(subArr)
            }
        }
        
        return res
    }
}

//Definition for a binary tree node.
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
