//
//  xiapi_05.swift
//  ForDreams
//
//  Created by cao hua on 2022/6/17.
//

import Foundation

/**
 动态规划
 难就难在抽象
 // 举例: days = [4,20], costs = [2,7,15]
 // 从第20天到第4天倒序开始计算, 其他天数都是0
 // 第20天的花费: 三种方案的最小值
 /*
  第一次计算:
 {  第20天,今天要出门的情况:
     方案一: 只买第20天一天的票价(costs[0]) + dp[21]之后的钱 --> dp[21] 初始值为0         ==> 2元
     方案二: 买第20~26这七天的票价(costs[1]) + dp[27]之后的钱 --> dp[27] 初始值为0       ==> 7元
     方案三: 买第20~49这三十天的票价(costs[2]) + dp[50]之后的钱 --> dp[49] 初始值为0     ==>  15元
     得出结论: dpArr[20] = 2元
 }
  第二次计算:
  { 第19天,今天不出门的情况:
     第19天不用花钱买票,到目前为止,计算的总结果,就是等于第20天的花费
     即: dpArr[19] = dpArr[20] ==> 2元
  }
  ... 以此类推
  最后一次计算:
  {  第4天,今天要出门
     方案一: 只买第4天, costs[0] + dp[5] (因为dp[5] = dp[6] = dp[7] =....= dp[20] == 2)     ==>2+2元
     方案二: 只买第4~10这七天, costs[1] + dp[11] (因为dp[11] = dp[12] = ... = dp[20] == 2)   ==> 7+2元
     方案三: 买第4~33这30天, cosst[2] + dp[34] (因为dp[34]的初始值 = 0 )                      ==> 15+0 元
  }
 */
 */
class xiapi_05 {
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        let firstDay = days[0] // 要出门的第一天
        let lastDay = days[days.count - 1]  // 要出门的最后一天
        
        var dpArr = [Int](repeating: 0, count: days.last! + 31)
        
        var index = days.count - 1 // 所有要出门的天数数组的最后一个下标
        for i in (firstDay...lastDay).reversed() {
            if i == days[index] { // 第i天, 是属于要出门的数组集合里面,说明第i天是要计划出门的日子
                dpArr[i] = min(dpArr[i+1] + costs[0], dpArr[i+7] + costs[1], dpArr[i+30] + costs[2])
                index -= 1
            } else { // 不出门的时候,因为是从后往前算,所以(第i天)不出门的花费,等于(第i+1)天
                dpArr[i] = dpArr[i+1]
            }
        }
        print(dpArr[firstDay])
        return dpArr[firstDay]
    }
}
