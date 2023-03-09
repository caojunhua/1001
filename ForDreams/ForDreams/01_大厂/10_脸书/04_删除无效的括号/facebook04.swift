//
//  facebook04.swift
//  ForDreams
//
//  Created by cao hua on 2022/6/25.
//

import Foundation

class facebook04 {
    //s = "()())()"
    //s = "(')'())()"
    //    "()()')'()"
    var res = [String]()
    
    func removeInvalidParentheses(_ s: String) -> [String] {
        // 1.遍历左右两边的括号多余的数量
        let left = getLRCount(s).first! // 0
        let right = getLRCount(s).last! // 1
        
        //
        helper(s, 0, left, right)
        
        return res
    }
    
    private func getLRCount(_ s: String) -> [Int] {
        var left = 0
        var right = 0
        
        for c in s {
            if String(c) == "(" {
                left += 1
            } else if String(c) == ")" {
                if left == 0 {
                    right += 1
                } else {
                    left -= 1
                }
            }
        }
        
        return [left, right]
    }
    
    private func helper(_ s: String, _ start: Int, _ left: Int, _ right: Int) {
        if left == 0 && right == 0 {
            if isValid(s) {
                res.append(s)
            }
            return
        }
        
        for i in start..<s.count {
            if i != start && s.charAt(i) == s.charAt(i - 1) {
                continue
            }
            
            if left + right > s.count - i { // ")))" -- 要没有添加元素了
                return
            }
            
            if left > 0 && s.charAt(i) == "(" {
                let tempArr = Array(s)
                let pre = String(tempArr[0..<i])
                let post = String(tempArr[(i+1)..<s.count])
                let tempStr = pre + post
                helper(tempStr, i, left - 1, right)
            }
            
            if right > 0 && s.charAt(i) == ")" {
                let tempArr = Array(s)
                let pre = String(tempArr[0..<i])
                let post = String(tempArr[(i+1)..<s.count])
                let tempStr = pre + post
                helper(tempStr, i, left, right - 1)
            }
        }
    }
    
    private func isValid(_ s: String) -> Bool {
        var cnt = 0
        for c in s {
            if String(c) == "(" {
                cnt += 1
            } else if String(c) == ")" {
                cnt -= 1
                if cnt < 0 {
                    return false
                }
            }
        }
        
        return cnt == 0
    }
}

extension String {
    func charAt(_ index: Int) -> Character {
        let tempArr = Array(self)
        return tempArr[index]
    }
}

