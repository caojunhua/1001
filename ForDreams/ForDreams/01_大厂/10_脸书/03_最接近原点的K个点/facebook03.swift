//
//  facebook03.swift
//  ForDreams
//
//  Created by cao hua on 2022/6/25.
//

import Foundation

class facebook03 {
    // 求距离最小的topK,建大顶堆
    // 堆的堆顶元素,是topK的最后一个,也就是说,后面的值,比较,只需要和最顶端的元素进行比较
    // 这就是为什么说,求topK小,建大顶堆
    // 反过来说,如果求topK大,就建小顶堆
    // 总结记忆口诀: topK大,小顶堆;topK小,大顶堆
    
    var lock = NSLock()
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        let heap = MyHeap(k)
        
        for i in 0..<points.count {
            let curPoint = points[i]
            lock.lock()
            let val = helper(curPoint) //[[6,10],[-3,3],[-2,5],[0,2]]
            print(i,"--",val)
            heap.createHeap([i: val])
            lock.unlock()
        }
        
        var res = [[Int]]()
        
        for i in 0..<k {
            let ele = heap.heapArr[i]
            let index = ele.first!.key
            res.append(points[index])
        }
        
        return res
    }
    
    func helper(_ p:[Int]) -> Int {
        return p[0] * p[0] + p[1] * p[1]
    }
}

class MyHeap {
    var heapArr = [[Int: Int]]()
    var topK: Int!
    init(_ top: Int) {
        topK = top
    }
    

    func createHeap(_ dict: [Int: Int]) {
        if heapArr.count < topK {
            heapArr.append(dict)
            siftUp(heapArr.count - 1)
        } else {
            if !compare(dict, heapArr[0]) {
                heapArr.append(dict)
                heapArr.swapAt(0, heapArr.count - 1)
                heapArr.removeLast()
                siftDown(0)
            }
        }
    }
    
    private func siftUp(_ index: Int) {
        if index < 1 {
            return
        }
        let parent = (index - 1) / 2
        if compare(heapArr[index], heapArr[parent]) {
            heapArr.swapAt(parent, index)
            siftUp(parent)
        }
        
    }
    
    private func siftDown(_ index: Int) {
        var left = index * 2 + 1
        var right = index * 2 + 2
        var parent = index
        
        if left < heapArr.count && !compare(heapArr[parent], heapArr[left]) {
            swap(&parent, &left)
        }
        
        if right < heapArr.count && !compare(heapArr[parent], heapArr[right]) {
            swap(&parent, &right)
        }
        
        if parent != index {
            heapArr.swapAt(parent, index)
            siftDown(parent)
        }
    }
    
    private func compare(_ ele1: [Int: Int], _ ele2: [Int: Int]) -> Bool {
        
        if ele1.first!.value > ele2.first!.value {
            return true
        } else {
            return false
        }
    }
    
}
