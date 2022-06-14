//
//  xiapi_02.swift
//  ForDreams
//
//  Created by cao hua on 2022/6/15.
//

import Foundation

/**
 输入：nums = [3,6,5,1,8]
 输出：18
 解释：选出数字 3, 6, 1 和 8，它们的和是 18（可被 3 整除的最大和）。
 */
/**
 思路:
 1. 用一个数组来存放每一种余数的最大和
 2. 被3整除的余数,情况就是0,1,2
 3. 就是计算前缀和中,当余数是0,1,2的所有情况的最大值
 */
class xiapi_02 {
    
    func maxSumDivThree(_ nums: [Int]) -> Int {
        var resArr = [0,0,0]
        for i in 0..<nums.count {
            let val = nums[i]
            let a = resArr[0] + val
            let b = resArr[1] + val
            let c = resArr[2] + val
            
            // 1.当加到余数为0的那一组中后的余数值
            let modValA = a%3
            // 2. 假设余数变为1了,那么就更新余数为1的那一组的数据
            // 看看是原来大还是现在的大(因为不排除有负数)
            resArr[modValA] = max(resArr[modValA], a)
            
            
            // 同理
            let modValB = b%3
            resArr[modValB] = max(resArr[modValB], b)
            
            // 同理
            let modValC = c%3
            resArr[modValC] = max(resArr[modValC], c)
        }
        
        return resArr[0]
    }
    
}
