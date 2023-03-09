//
//  xiapi_03.swift
//  ForDreams
//
//  Created by cao hua on 2022/6/15.
//

import Foundation

/**
 思路: 栈
 */
class xiapi_03 {
    func isValid(_ s: String) -> Bool {
        // 1. 如果是奇数个,肯定不行
        if s.count % 2 != 0 {
            return false
        }
        
        let arr = Array(s)
        var stack = [Character]()
        
        for i in 0..<arr.count {
            let cur = arr[i]
            
            // 先判断移除的情况
            if cur == ")" && stack.last == "(" {
                stack.removeLast()
            } else if cur == "]" && stack.last == "[" {
                stack.removeLast()
            } else if cur == "}" && stack.last == "{" {
                stack.removeLast()
            } else { // 其余的就是添加的情况了
                stack.append(cur)
            }
        }
        
        if stack.count == 0 {
            return true
        } else {
            return false
        }
    }
}
