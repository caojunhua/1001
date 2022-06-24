//
//  facebook02.swift
//  ForDreams
//
//  Created by cao hua on 2022/6/24.
//

import Foundation

class facebook02 {
    // aba  abcdba  abc    ab cdedcf ba
    func validPalindrome(_ s: String) -> Bool {
        var temp = Array(s).map({String($0)})
        var isDeleted = false
        
        func helper1( _ left: Int, _ right: Int) -> Bool {
            var left = left
            var right = right
            
            while left < right {
                if temp[left] == temp[right] {
                    left += 1
                    right -= 1
                } else {
                    if isDeleted {
                        return false
                    }
                    isDeleted = true
                    return helper1(left + 1, right) || helper1(left, right - 1) // 删除左边或右边,都要考虑到
                }
            }
            
            return true
        }
        
        return helper1(0, temp.count - 1)
    }
    
    
    
    func helper2(_ temp: inout [String]) -> Bool {
        var left = 0
        var right = temp.count - 1
        
        var isDeleted = false
        while left < right {
            if temp[left] == temp[right] {
                left += 1
                right -= 1
            } else {
                if isDeleted {
                    return false
                }
                
                if temp[left] == temp[right - 1] {
                    right -= 1
                } else if temp[left + 1] == temp[right] {
                    left += 1
                } else {
                    return false
                }
                isDeleted = true
            }
        }
        
        return true
    }
}
