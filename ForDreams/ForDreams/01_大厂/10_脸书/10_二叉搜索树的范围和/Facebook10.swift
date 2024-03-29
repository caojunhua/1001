//
//  Facebook10.swift
//  ForDreams
//
//  Created by cao hua on 2022/7/23.
//

import Foundation

/**
 给定二叉搜索树的根结点 root，返回值位于范围 [low, high] 之间的所有结点的值的和。
 */
class Facebook10 {
    var sum = 0
    var queue: [TreeNode] = [TreeNode]()
    
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
//        dfs(root: root, low: low, high: high)
        if root == nil {
            return sum
        }
        
        bfs(root: root, low: low, high: high)
        
        return sum
    }
    
    func dfs(root: TreeNode?, low: Int, high: Int) {
        if root == nil {
            return
        }
        if root!.val >= low && root!.val <= high {
            sum += root!.val
        }
        dfs(root: root?.left, low: low, high: high)
        dfs(root: root?.right, low: low, high: high)
    }
    
    func bfs(root: TreeNode?, low: Int, high: Int) {
        if root != nil {
            queue.append(root!)
        }
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            let value = node.val
            
            if value >= low && value <= high {
                sum += value
            }
            
            if node.left != nil {
                queue.append(node.left!)
            }
            
            if node.right != nil {
                queue.append(node.right!)
            }
        }
    }
}
