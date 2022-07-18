//
//  facebook06.swift
//  ForDreams
//
//  Created by cao hua on 2022/7/18.
//

import Foundation

class facebook06 {
    func subarraySum1(_ nums: [Int], _ k: Int) -> Int {
        
//        [3,2,1,4,5,6,3] k = 5
        var count = 0
        for start in 0..<nums.count {
            var sum = 0
            for end in start..<nums.count {
                sum += nums[end]
                if sum == k {
                    count += 1
                }
            }
        }
        
        return count
    }
    
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        
        var count = 0
        var dict: [Int: Int] = [0: 1]
        var sum = 0
        for i in 0..<nums.count {
            sum += nums[i]
            if dict.keys.contains(sum - k) {
                count += dict[sum - k]!
            }
            
            if let value = dict[sum] {
                dict[sum] = value + 1
            } else {
                dict[sum] = 1
            }
        }
        
        return count
    }
}
