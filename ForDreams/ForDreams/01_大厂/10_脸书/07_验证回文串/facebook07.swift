//
//  facebook07.swift
//  ForDreams
//
//  Created by cao hua on 2022/7/20.
//

import Foundation

class facebook07 {
    func isPalindrome(_ s: String) -> Bool {
        let nums: [String.Element] = ["0","1","2","3","4","5","6","7","8","9"]
        let tempArr: [String.Element] = Array(s.lowercased()).reduce(into: []) { partialResult, char in
            if char >= "a" && char <= "z" || nums.contains(char) {
                partialResult.append(char)
            }
        }
//        print(tempArr)
        
        var left = 0, right = tempArr.count - 1
        
        while left <= right {
            if tempArr[left] == tempArr[right] {
                left += 1
                right -= 1
            } else {
                return false
            }
        }
        
        return true
    }
}
