//
//  xiapi_09.swift
//  ForDreams
//
//  Created by cao hua on 2022/6/22.
//

import Foundation

class xiapi_09 {
    //字典方法
    func palindromePairs(_ words: [String]) -> [[Int]] {
        var dict = [String: Int]()
        var res = [[Int]]()
        
        words.enumerated().forEach { (index, str) in
            dict[String(str.reversed())] = index
        }
        
        for (index, s) in words.enumerated() {
            if s.isEmpty {
                dict.forEach { (Str, idx) in
                    if checkIsOK(Str) && index != idx {
                        res.append([index,idx])
                    }
                }
            }
            
            for j in 0..<s.count {
                let mid = s.index(s.startIndex, offsetBy: j)
                let leftPart = String(s[..<mid])
                let rightPart = String(s[mid...])
                
                if checkIsOK(leftPart) && dict[rightPart] != nil && dict[rightPart] != index {
                    res.append([dict[rightPart]!, index])
                }
                if checkIsOK(rightPart) && dict[leftPart] != nil && dict[leftPart] != index {
                    res.append([index, dict[leftPart]!])
                }
            }
        }
        
        return res
    }
    
    // 拼接方法
    func palindromePairsTimeout(_ words: [String]) -> [[Int]] {
        let n = words.count
        var res = [[Int]]()
        
        for i in 0..<n-1 {
            let str1 = words[i]
            for j in i+1..<n {
                let str2 = words[j]
                if checkIsOK(str1 + str2) {
                    res.append([i,j])
                }
                if checkIsOK(str2 + str1) {
                    res.append([j,i])
                }
            }
        }
        
        return res
    }
    
    func checkIsOK(_ s: String) -> Bool {
        return s == String(s.reversed())
    }
    
    /*
    func checkIsOK(_ s: String) -> Bool {
        if s.count == 1 {
            return true
        }
        
        var left = 0, right = s.count - 1
        let arr = Array(s)
        while left <= right {
            
            if arr[left] != arr[right] {
                return false
            }
            left += 1
            right -= 1
            if s.count % 2 == 1,left == right {
                break
            }
        }
        
        return true
    }
    */
    
}
