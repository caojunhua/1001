//
//  xiapi_12.swift
//  ForDreams
//
//  Created by cao hua on 2022/6/23.
//

import Foundation

class xiapi_12 {
    func mergeTwoLists(_ list1: ListNode12?, _ list2: ListNode12?) -> ListNode12? {
        if list2 == nil {
            return list1
        }
        if list1 == nil {
            return list2
        }
        
        if list1?.val ?? 0 < list2?.val ?? 0 {
            list1?.next = mergeTwoLists(list1?.next, list2)
            return list1
        } else {
            list2?.next = mergeTwoLists(list2?.next, list1)
            return list2
        }
    }
}

public class ListNode12 {
    public var val: Int
    public var next: ListNode12?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode12?) { self.val = val; self.next = next; }
}
