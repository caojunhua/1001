//
//  DFSBFS.swift
//  ForDreams
//
//  Created by cao hua on 2022/7/14.
//

import Foundation

/**
 DFS & BFS 套路总结
 1. 相同之处,对二维数组进行两层for循环遍历
 2. DFS特点:
     (a) 判断当前是否越界
     (b) 看值是否遍历过,没有遍历过的记忆化标记
 
 3. BFS特点: (用队列来存放索引)
     (a) 每次BFS递归中,需要创建一个队列
     (b) 队列中存放需要存放的是下标数组[x, y] ;
     (c) 判断当前x, y是否符合没有越界, 判断 当前下标值,是否是没有遍历过的,如果符合条件就放入队列
     (d) 并且把当前下标对应元素重新赋值,进行记忆化标记
     (e) 上下左右四个方向进行遍历
 */
class DFS {
    let dir = [[-1,0],[1,0],[0,-1],[0,1]]
    
    func numIslands(_ grid: [[Character]]) -> Int {
        var cnt = 0
        var temp = grid
        
        for i in 0..<temp.count {
            for j in 0..<temp[0].count {
                if temp[i][j] == "1" {
                    dfs(&temp, i, j)
                    cnt += 1
                }
            }
        }
        
        return cnt
    }
    
    func dfs(_ grid: inout [[Character]],_ row: Int, _ column: Int) {
        let maxRow = grid.count
        let maxColumn = grid[0].count
        if row < 0 || row >= maxRow || column < 0 || column >= maxColumn || grid[row][column] != "1" {
            return
        }
        
        // 来到这里,原来的值就是1,标记为2
        grid[row][column] = "2"
        
        for i in 0..<dir.count {
            let newRow = row + dir[i][0]
            let newColumn = column + dir[i][1]
            dfs(&grid, newRow, newColumn)
        }
    }
    
}


class BFS {
    var dirs = [[-1,0],[1,0],[0,-1],[0,1]]
    
    func numIslands(_ grid: [[Character]]) -> Int {
        var cnt = 0
        
        var temp = grid
        
        for i in 0..<temp.count {
            for j in 0..<temp[0].count {
                if temp[i][j] == "1" {
                    cnt += 1
                    bfs(&temp, i, j)
                }
            }
        }
        
        return cnt
    }
    
    func bfs(_ grid: inout [[Character]], _ row: Int, _ column: Int) {
        var queue = [[Int]]()
        if row >= 0 && row < grid.count && column >= 0 && column < grid[0].count && grid[row][column] == "1" {
            grid[row][column] = "2"
            queue.append([row, column])
        }
        
        while !queue.isEmpty {
            let first = queue.removeFirst()
            let i = first[0], j = first[1]
            
            for dir in dirs {
                let newRow = i + dir[0]
                let newColumn = j + dir[1]
                bfs(&grid, newRow, newColumn)
            }
        }
    }
}
