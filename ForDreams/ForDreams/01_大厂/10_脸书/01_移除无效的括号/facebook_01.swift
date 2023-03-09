//
//  facebook_01.swift
//  ForDreams
//
//  Created by cao hua on 2022/6/23.
//

import Foundation

class facebook_01 {
    //s = "lee(t(c)o)de)" // "a)b(c)d" //"(a(b(c)d)" //"())()(((" "()"
    //"())()((("
    func minRemoveToMakeValid(_ s: String) -> String {
        var arr = Array(s).map{String($0)}
        var stack = [[Int: String]]()
        
        var left = 0
        while left < arr.count {
            if stack.isEmpty {
                if arr[left] == ")" {
                    arr.remove(at: left)
                } else {
                    if arr[left] == "(" {
                        let dict = [left: "("]
                        stack.append(dict)
                    }
                    left += 1
                }
            } else {
                // 栈非空,取出栈顶元素进行匹配,能匹配上,就删除
                let topEle = stack[stack.count - 1]
                if topEle.first!.value == "(" && arr[left] == ")" {
                    stack.removeLast()
                }
                if arr[left] == "(" {
                    let dict = [left: "("]
                    stack.append(dict)
                }
                left += 1
            }
            
        }
        
        if !stack.isEmpty {
            for i in (0..<stack.count).reversed() {
                arr.remove(at: stack[i].first!.key)
            }
        }
        
        return arr.reduce("", +)
    }
}
