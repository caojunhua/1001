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
        
        // [1,2,2,1,3,4,5] k = 4
        /**
         和为4,也可以是前5个数组元素减去前3个数组元素
         
           1,2,2,1,3
         - 1,2,2
         ------------
                4
         
        (1) var dict: [Int: Int] = [0: 1] 代表的意思:
        数组和为0的,存在1个,就是下标为0的前面,也就是没有元素的情况
         (2) count += dict[sum - k]! 代表的意思:
         总数量是 : 字典中符合情况的value的和
         */
        
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
