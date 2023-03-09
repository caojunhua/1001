//
//  xiapi_11.swift
//  ForDreams
//
//  Created by cao hua on 2022/6/23.
//

import Foundation

class xiapi_11 {
    
    // 正统解法: 字典
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var res = 0
        let arr = Array(s)
        var left = 0
        var dict = [Character: Int]()
        
        //"abcdc"
        for right in 0..<arr.count {
            if let value = dict[arr[right]] { // right = 4 , value = dict[c] = 2
                left = max(value + 1, left) // max(3, 0)
            }
            dict[arr[right]] = right // [[a: 0], [b: 1],[c: 2],[d: 3]]
            res = max(res, right - left + 1)
        }
        
        return res
    }
    
    // 思路二: 滑动窗口
    func lengthOfLongestSubstring02(_ s: String) -> Int {
        let temp = s + " "
        let arr = Array(temp)
        var left = 0
        var right = 0
        var maxLen = 0
        
        while right < arr.count - 1 { // 最后一个字符遍历不到,所以在前面对s + " "
            let subArr = arr[left...right].map{String($0)}
            maxLen = max(subArr.count, maxLen)
            print("subArr--",subArr)
            //"abcabcbb"
            let nextStr = String(arr[right + 1])
            for i in 0..<subArr.count {
                if subArr[i] == nextStr {
                    left += (i+1)
                }
            }
            right += 1
        }
        
        return maxLen
    }
}
