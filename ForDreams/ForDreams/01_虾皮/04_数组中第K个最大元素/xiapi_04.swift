//
//  xiapi_04.swift
//  ForDreams
//
//  Created by cao hua on 2022/6/15.
//

import Foundation
/**
 输入: [3,2,1,5,6,4] 和 k = 2
 输出: 5
 */

/**
 用 let resArr = nums.sorted(by: >)
 return resArr[k-1]
 
 这种也是可以的,但是这个不是考点
 
 考点: 建堆, 上溢, 下溢
 求第k个最大,就是把顶部元素,删除k-1次,每删除一次后,重新调整堆
 */
class xiapi_04 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        
        
        let heap = Heap(k, nums)
        heap.createHeap()
        
        for _ in 0..<k-1 {
            heap.removeTop()
        }
        
        return heap.heapArr[0]
    }
}

class Heap {
    var k: Int
    var arr = [Int]()
    var heapArr = [Int]()
    
    init(_ k: Int, _ arr: [Int]) {
        self.k = k
        self.arr = arr
    }
    
    func createHeap() {
        for i in 0..<arr.count {
            heapArr.append(arr[i])
            siftUp(heapArr.count - 1)
        }
    }
    
    func siftUp(_ index: Int) {
        if index > 0 {
            let parent = (index - 1) / 2
            if heapArr[index] >= heapArr[parent] {
                heapArr.swapAt(index, parent)
                siftUp(parent)
            }
        }
    }
    
    func removeTop() {
        heapArr.swapAt(0, heapArr.count - 1)
        heapArr.removeLast()
        siftDown(0)
    }
    
    func siftDown(_ index: Int) {
        var nextReplaceIndex = index
        let left = index * 2 + 1
        let right = left + 1
        
        // 注意这里,左右都进行比较一次,先不交换
        if left < heapArr.count && heapArr[nextReplaceIndex] <= heapArr[left] {
            nextReplaceIndex = left
        }
        
        if right < heapArr.count &&  heapArr[nextReplaceIndex] <= heapArr[right] {
            nextReplaceIndex = right
        }
        
        // 如果发现需要调整顺序,再开始交换
        if nextReplaceIndex != index {
            heapArr.swapAt(nextReplaceIndex, index)
            siftDown(nextReplaceIndex)
        }
        
    }
}
