//
//  BJArithmeticViewController.swift
//  BJSwiftDemo
//
//  Created by zhangwenjun on 2019/9/9.
//  Copyright © 2019 zcgt_ios_01. All rights reserved.
//

import Foundation
import UIKit

//MARK:- 链表
public class ListNode { // 链表节点
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

//MARK:- 树
public class TreeNode {
     public var val: Int
     public var left: TreeNode?
     public var right: TreeNode?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
     }
}


//MARK:-
class BJArithmeticViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad();
        self.view.backgroundColor = UIColor.white;
        
//        let value = self.twoSum(nums: [1, 2, 3], targer: 4)
        
//        let value = self.reverse(x: 123)
        
//        let value = self.isPalindrome(x: 12321)
        
//        let value = self.romanToInt(s: "I")
        
//        let value = self.longestCommonPrefix(["abcdfghikd", "abcde", "abef"])
        
//        let value = self.isValid("(())())")
        
//        let l1 = ListNode.init(1)
//        let l2 = ListNode.init(2)
//        let value = self.mergeTwoLists(l1, l2)
        
//        var list = [1, 1, 2]
//        let value = self.removeDuplicates(&list)
        
        
//        var list = [1, 1, 2,4]
//        let value = self.removeElement(&list, 1)
        
//        let value = self.searchInsert([1, 2, 3, 4], 2)
        
        
        
        let one = ListNode(1)
        let two = ListNode(1)
        let three = ListNode(2)
        let four = ListNode(2)
        let five = ListNode(3)
        let six = ListNode(4)

        one.next = two
        two.next = three
        three.next = four
        four.next = five
        five.next = six
        
//        let value = self.hasCycle(head: one)
        

//        let value = self.deleteDuplicates(one)
//
//        while value?.next != nil {
//            print("node val: \(value?.val)")
//        }
        
        
//        let one = TreeNode(4)
//        let oneLeft = TreeNode(7)
//        let oneRight = TreeNode(8)
//        let node = TreeNode(9)
//        let node2 = TreeNode(10)
//
//        one.left = oneLeft
//        one.right = oneRight
//        oneLeft.right = node
//        node.right = node2
//
//        let two = TreeNode(1)
//        let twoLeft = TreeNode(2)
//        let twoRight = TreeNode(3)
//        two.left = twoLeft
//        two.right = twoRight
//
//        let value = self.isSameTree(one, two)
        
//        let value = self.isSymmetric(one)
        
//        let value = self.quickSorting(arr: [6,5,7,1,3,2,4])
    
//        let value = levelOrderBottom(one)
        
//        let value = self.sortedArrayToBST([1,3,4,5,12,34,56,65,76,88,235,444])
        
//        let value = self.reverseList(one)
        
//        let value = self.firstUniqChar("abcdabc")
        
        
        
//        print(value)
        
    }
    //MARK:- 《《《---排序算法---》》》
    //MARK: 冒泡排序
    func bubbleSorting(arr: [Int]) -> Array<Int> {
        var sortArr: [Int] = arr
        for i in 0..<sortArr.count {
            for j in 0..<sortArr.count-1-i {
                if sortArr[j] > sortArr[j+1] {
                    sortArr.swapAt(j, j+1)
                }
                print(sortArr)
            }
        }
        return sortArr
    }
    
    //MARK: 选择排序
    func selectionSorting(arr: [Int]) -> Array<Int> {
        var sortArr = arr
        let n = sortArr.count
        for i in 0..<n {
            var minIndex = i //寻找[i, n)区间最小的值
            for j in (i+1)..<n {
                if sortArr[minIndex] > sortArr[j] {
                    minIndex = j
                }
            }
            sortArr.swapAt(i, minIndex)
        }
        return sortArr
    }
    
    //MARK: 插入排序
    func insertSorting(arr: [Int]) -> Array<Int> {
        var sortArr = arr
        for i in 0..<sortArr.count {
            for j in stride(from: i, to: 0, by: -1) {
                if sortArr[j] < sortArr[j-1] {
                    sortArr.swapAt(j, j-1)
                }
            }
        }
        return sortArr
    }
    
    //MARK: 希尔排序
    var data: [Int] = Array()
    func shellSorting(arr: [Int]) -> Array<Int> {
        self.data = arr
        let incremental = arr.count
        recursiveShellSort(incremental: incremental) // 先递归
        self.data = insertSorting(arr: self.data) // 插入排序
        return self.data
    }
    func recursiveShellSort(incremental: Int) { // 递归
        if incremental == 0 {
            return
        }
        for index in 0..<data.count - incremental {
            let a = data[index]
            let b = data[index + incremental]
            if a > b {
                data.swapAt(index, index+incremental)
            }
        }
        recursiveShellSort(incremental: incremental/2)
    }
    
    //MARK: 归并排序
    var sortArr: [Int] = Array()
    func merageSorting(arr: [Int]) -> Array<Int> {
        sortArr = arr
        recursiveSort(l: 0, r: arr.count-1)
        return sortArr
    }
    func recursiveSort(l: Int, r: Int) {
        if l >= r {
            return
        }
        let mid = (l + r)/2
        print("开始")
        print(mid)
        recursiveSort(l: l, r: mid)
        recursiveSort(l: mid+1, r: r)
        print("递归结束")
        print(mid)
        merge(l: l, mid: mid, r: r)
    }
    func merge(l: Int, mid: Int, r: Int) {
        var aux: [Int] = Array()
        for i in l..<r+1 {
            aux.append(sortArr[i])
        }
        print(aux)
        
        var i = l
        var j = mid+1
        
        for k in l..<r+1 {
            if i > mid {
                sortArr[k] = aux[j-l]
                j += 1
            } else if j > r {
                sortArr[k] = aux[i-l]
                i += 1
            } else if aux[i-l] - aux[j-l] < 0 {
                sortArr[k] = aux[i-l]
                i += 1
            } else {
                sortArr[k] = aux[j-l]
                j += 1
            }
        }
    }
    
    
    //MARK: 快速排序
    var qArr: [Int] = Array()
    
    func quickSorting(arr: [Int]) -> Array<Int> {
        self.qArr = arr
        recursiveQuickSort(l: 0, r: qArr.count-1)
        return self.qArr
    }
    func recursiveQuickSort(l: Int, r: Int) {
        if l >= r {
            return
        }
        let p = partition(l: l, r: r)
        recursiveQuickSort(l: l, r: p-1)
        recursiveQuickSort(l: p+1, r: r)
    }
    func partition(l: Int, r: Int) -> Int {
        let v = qArr[l]
        var j = l
        for i in l+1..<r+1 {
            if qArr[i] < v {
                j += 1
            }
        }
        qArr.swapAt(l, j)
        print(qArr)
        return j
    }
    
    //MARK:- 《《《---查找算法---》》》
    //MARK: 顺序查找
    
    //MARK: 二分查找
    func binarySearch(list: [Int], key: Int) -> Int {
        var low = 0
        var high = list.count - 1
        var time = 0
        while low <= high {
            time += 1
            let mid = (low + high) / 2
            if key < list[mid] {
                high = mid - 1
            } else if key > list[mid] {
                low = mid + 1
            } else {
                print(time)
                return mid
            }
        }
        return 0
    }
    
    //MARK: 插值查找
    func insertSearch(list: [Int], key: Int) -> Int {
        var low = 0
        var high = list.count - 1
        var time = 0
        while low <= high {
            time += 1
            // 计算mid值是插值算法的核心代码
            let mid = low + (high - low) * (key - list[low])/(list[high] - list[low])
            if key < list[mid] {
                high = mid - 1
            } else if key > list[mid] {
                low = mid + 1
            } else {
                print(time)
                return mid
            }
        }
        return 0
    }
    
    //MARK: 斐波那契查找
    func fibonacciSearch(list: [Int], key: Int) -> Int {
        let F = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144,
                 233, 377, 610, 987, 1597, 2584, 4181, 6765,
                 10946, 17711, 28657, 46368]
        
        var low = 0
        var high = list.count - 1
        var mid = 0
        
        var arr = list
        
        // 为了使得查找表满足斐波那契特性，在表的最后添加几个同样的值
        // 这个值是原查找表的最后那个元素的值
        // 添加的个数由F[k]-1-high决定
        var k = 0
        while high > F[k] - 1 {
            k += 1
        }
        print(k)
        var i = high
        while F[k]-1 > i {
            arr.append(arr[high])
            i += 1
        }
        print(arr)
        
        // 主逻辑
        var time = 0
        while low <= high {
            time += 1
            // 防止F列表下标溢出
            if k < 2 {
                mid = low
            } else {
                mid = low + F[k-1] - 1
            }
            
            if key < arr[mid] {
                high = mid - 1
                k -= 1
            } else if key > arr[mid] {
                low = mid + 1
                k -= 2
            } else {
                print(time)
                if mid <= high {
                    return mid
                } else {
                    return high
                }
            }
        }
        return 0
    }
    
}