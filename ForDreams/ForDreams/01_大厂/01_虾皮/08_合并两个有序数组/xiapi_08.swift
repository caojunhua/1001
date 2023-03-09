//
//  xiapi_08.swift
//  ForDreams
//
//  Created by cao hua on 2022/6/20.
//

import Foundation

class xiapi_08 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var res = [Int]()
        var l1 = 0
        var l2 = 0
        
        if m == 0 {
            nums1 = nums2
            return
        }
        if n == 0 {
            return
        }
        
        while l1 < m || l2 < n {
            if nums1[l1] <= nums2[l2] {
                res.append(nums1[l1])
                l1 += 1
                if l1 == m {
                    for i in l2..<n {
                        res.append(nums2[i])
                        
                    }
                    break
                }
            } else {
                res.append(nums2[l2])
                l2 += 1
                if l2 == n {
                    for i in l1..<m {
                        res.append(nums1[i])
                    }
                    break
                }
            }
        }
        print(res)
        nums1 = res
    }
}
