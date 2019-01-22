import UIKit

//Max Array Sum

func maxSubsetSum(arr: [Int]) -> Int {
    var ar = arr
    for n in 2...arr.count-1 {
        ar[n] = max(ar[n-1], ar[n]+ar[n-2])
    }
    return ar[ar.count-1]
}

maxSubsetSum(arr: [3, 7, 4, 6, 5])

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var num1 = 0
    var num2 = 0
    
    //brute force
    for i in 0...nums.count-1 {
        for j in 0...nums.count-1 where j != i {
            if nums[i] + nums[j] == target {
                num1 = i
                num2 = j
            }
        }
    }
    return [num1, num2]
}
var string = ""
string = string + "k"

var ans = twoSum([2,7,11,15], 9)
