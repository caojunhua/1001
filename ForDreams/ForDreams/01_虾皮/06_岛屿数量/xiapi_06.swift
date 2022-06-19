//
//  xiapi_06.swift
//  ForDreams
//
//  Created by cao hua on 2022/6/20.
//

import Foundation

class xiapi_06 {
    var dirs = [[-1,0],[1,0],[0,-1],[0,1]]
    func numIslands(_ grid: [[Character]]) -> Int {
        var girdCopy = grid
        var res = 0
        for row in 0..<girdCopy.count {
            for column in 0..<girdCopy[0].count {
                if girdCopy[row][column] == "1" {
                    res += 1
                    DFS(&girdCopy, row, column)
                }
            }
        }
        
        return res
    }
    
    func DFS(_ grid: inout [[Character]], _ row: Int, _ column: Int) {
        if row < 0 || row >= grid.count || column < 0 || column >= grid[0].count || grid[row][column] != "1" {
            return
        }
        grid[row][column] = "2"
        for dir in dirs {
            DFS(&grid, row+dir[0], column+dir[1])
        }
    }
}
