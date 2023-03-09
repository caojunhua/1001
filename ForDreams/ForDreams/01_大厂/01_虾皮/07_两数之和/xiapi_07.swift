//
//  xiapi_07.swift
//  ForDreams
//
//  Created by cao hua on 2022/6/20.
//

import Foundation

class xiapi_07 {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()
        var res = [Int]()
        for i in 0..<nums.count {
            let nextV = target - nums[i]
            if let nextKey = dict.getKeyForValue(value: nextV) {
                res = [nextKey,i]
            }
            dict[i] = nums[i]
        }
        
        
        
        return res
    }
}

extension Dictionary where Value: Equatable {
    func getKeyForValue(value: Value) -> Key? {
        return self.first(where: {$1 == value})?.key
    }
}


