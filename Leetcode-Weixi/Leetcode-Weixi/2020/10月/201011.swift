//
//  201011.swift
//  Leetcode Every
//
//  Created by 孙世伟 on 2020/10/11.
//


//打印不换行 terminator: ""
import Foundation

class Solution201011 {
        func canPartition(_ nums: [Int]) -> Bool {
            var sum = 0
            for i in 0..<nums.count {
                let num = nums[i]
                sum += num
            }
    
            if sum % 2 != 0 {
                return false
            }
    
            let count = nums.count
            sum = sum / 2       //sum : 11
            // 方法二：一维数组dp
            var dp = [Bool](repeating: false, count: sum + 1)   //建立一个数量为(sum+1)的组
            dp[0] = true        //第一个是真的
            for i in 0..<count {        //同向    4
                for j in (0..<dp.count).reversed() {        //反向    11个数组
                    print()
                    print("j:" + "\(j)" + "    " + "nums[i]:"  + "\(nums[i])")
                    print("j-nums[i]:" + "\(j-nums[i])")
                    if j - nums[i] >= 0 {
                        dp[j] = dp[j] || dp[j - nums[i]]
                    }
                    printDP(dp)
                }
            }
            return dp[sum]
        }
    func printDP(_ dp:[Bool]){
        for i in dp.indices{
            print(i,terminator: "")
            print(" ",terminator: "")
        }
        print()
        for i in dp.indices {
            if dp[i] == true {
                print(1,terminator: "")
                print(" ",terminator: "")
            }else if dp[i] == false{
                print(0,terminator: "")
                print(" ",terminator: "")
            }
        }
    }
    
//-MARK:DFS
    var result: Bool = false
    var target: Int = 0
    func CanPartition(_ nums: [Int]) -> Bool {
        var sum: Int = 0
        for i in nums.indices {
            target += nums[i]
        }
        if target % 2 == 1 {
            return result
        }
        target = target/2
        DFS(0,nums,&sum)
        return result
    }

    func DFS(_ index: Int ,_ nums: [Int],_ sum: inout Int){
        if sum == target {
            result = true
            return
        }
        if sum > target {
            return
        }
        for start in index..<nums.count {
            sum += nums[start]
            if result == true {
                break
            }
            print(sum)
            DFS(start+1, nums, &sum)
            sum -= nums[start]
        }

    }
}
