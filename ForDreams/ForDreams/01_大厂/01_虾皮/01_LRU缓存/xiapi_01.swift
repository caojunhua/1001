//
//  xiapi_01.swift
//  ForDreams
//
//  Created by cao hua on 2022/6/14.
//
/**
 题目解释:
 输入
 ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
 [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
 输出
 [null, null, null, 1, null, -1, null, -1, 3, 4]

 解释
 LRUCache lRUCache = new LRUCache(2);
 lRUCache.put(1, 1); // 缓存是 {1=1}
 lRUCache.put(2, 2); // 缓存是 {1=1, 2=2}
 lRUCache.get(1);    // 返回 1
 lRUCache.put(3, 3); // 该操作会使得关键字 2 作废，缓存是 {1=1, 3=3}
 lRUCache.get(2);    // 返回 -1 (未找到)
 lRUCache.put(4, 4); // 该操作会使得关键字 1 作废，缓存是 {4=4, 3=3}
 lRUCache.get(1);    // 返回 -1 (未找到)
 lRUCache.get(3);    // 返回 3
 lRUCache.get(4);    // 返回 4

 来源：力扣（LeetCode）
 链接：https://leetcode.cn/problems/lru-cache
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

/**
 思路:
1. 双向链表(链表里的元素是一个字典 ==> val: [Int: Int])
    + 哈希表
   举例:   调用放入 key = 3 value = 2
        实际操作: key = 3  value = [3: 2]
2. 每次最近使用了的元素,放到链表头部
3. 对于双向链表中的某个节点,放到链表头部
    3.1> 先直接把它删除了
    3.2> 再把它移动到链表头部
4. 先创建一个 左边不用的头节点, 再创建一个右边不用的头节点
        headNode  <------>  trailNode
 */
class xiapi_01 { // 已通过全用例! Success
    var capacity: Int
    var dict = [Int: ListNode]()
    var first = ListNode()
    var last = ListNode()
    
    init(_ capacity: Int) {
        self.capacity = capacity
        first.next = last
        last.pre = first
    }
    
    func get(_ key: Int) -> Int {
        guard let node = dict[key] else {
            return -1
        }
        removeNode(node)
        moveNodeToFirst(node)
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        // 1. 先看是否已经存放过,
        // 2. 如果已经存放过对应的key,更新key对应的value值
        // 3. 还需要把节点移动到最前面去
        
        if let node = dict[key] {
            // 更新value值
            node.value = value
            removeNode(node)
            moveNodeToFirst(node)
        } else {
            if dict.count == capacity {
                // 超出空间限制了
                // 1. 移除原来最后一个节点
                let lastNode = last.pre
                // 2. 需要移除的key,就是最后一个节点对应的key
                let rmkey = lastNode?.key
                dict.removeValue(forKey: rmkey!)
                // 3. 删除node
                removeNode(lastNode!)
            }
            // 2. 添加新节点到最前面
            let node = ListNode(key, value)
            dict[key] = node
            moveNodeToFirst(node)
        }
    }
    
    func removeNode(_ rmNode: ListNode) {
        let preNode = rmNode.pre
        let nextNode = rmNode.next
        preNode?.next = nextNode
        nextNode?.pre = preNode
    }
    
    func moveNodeToFirst(_ toBeMovedNode: ListNode) {
        let preHead = first.next
        first.next = toBeMovedNode
        toBeMovedNode.next = preHead
        preHead?.pre = toBeMovedNode
        toBeMovedNode.pre = first
    }
}

class ListNode {
    var next: ListNode?
    var pre: ListNode?
    var key: Int
    var value: Int
    
    init(_ key: Int = 0, _ value: Int = 0) {
        self.key = key
        self.value = value
    }
}
