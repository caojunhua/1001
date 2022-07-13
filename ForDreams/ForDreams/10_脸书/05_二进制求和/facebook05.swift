//
//  facebook05.swift
//  ForDreams
//
//  Created by cao hua on 2022/6/28.
//

import Foundation

class facebook05 {
    func addBinary(_ a: String, _ b: String) -> String {
        let arr1 = Array(a).reversed().map({Int(String($0))!})
        let arr2 = Array(b).reversed().map({Int(String($0))!})
        
        let maxCnt = max(arr1.count, arr2.count)
        
        var res = "", carry = 0
        for i in 0..<maxCnt {
            let s1 = i < arr1.count ? arr1[i] : 0
            let s2 = i < arr2.count ? arr2[i] : 0
            let tempSum = s1 + s2 + carry
            let str = tempSum > 1 ? tempSum - 2 : tempSum
            carry = tempSum > 1 ? 1 : 0
            
            res += String(str)
        }
        
        if carry == 1 {
            res += String(1)
        }
        return String(res.reversed())
    }
}
