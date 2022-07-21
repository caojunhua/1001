//
//  Facebook08.swift
//  ForDreams
//
//  Created by cao hua on 2022/7/21.
//

import Foundation

class Facebook08 {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let cnt = nums.count
        var LeftArr: [Int] = [Int](repeating: 1, count: cnt)
        var RightArr: [Int] = [Int](repeating: 1, count: cnt)
        
        for i in 1..<cnt {
            LeftArr[i] = LeftArr[i - 1] * nums[i - 1]
        }
        
        for i in (0..<cnt - 1).reversed() {
            RightArr[i] = RightArr[i + 1] * nums[i + 1]
        }
        
        var res = [Int]()
        for i in 0..<cnt {
            res.append(LeftArr[i] * RightArr[i])
        }
        
        return res
    }
}
