//
//  main.swift
//  ForDreams
//
//  Created by cao hua on 2022/6/14.
//

import Foundation

print("Hello, World!")

var nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
let res = xiapi_08().merge(&nums1, m, nums2, n)
print("res--",res)
