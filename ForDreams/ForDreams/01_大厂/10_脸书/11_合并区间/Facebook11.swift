//
//  Facebook11.swift
//  ForDreams
//
//  Created by cao hua on 2022/9/2.
//

import Foundation
class Facebook11 {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        var res = [[Int]]()
        
        let sortedArr = intervals.sorted(by: {$0.first! < $1.first!})
        
        let cnt = sortedArr.count
        for i in 0..<cnt {
            if i == 0 {
                res.append(sortedArr[i])
            } else {
                let tempArr = sortedArr[i]
                if res.last!.last! < tempArr.first! {
                    res.append(sortedArr[i])
                } else {
                    var lastArr = res.last!
                    let preLast = lastArr.last!
                    let newLast = tempArr.last!
                    lastArr.removeLast()
                    lastArr.append(preLast > newLast ? preLast : newLast)
                    res.removeLast()
                    res.append(lastArr)
                }
            }
            
        }
        
        return res
    }
}
