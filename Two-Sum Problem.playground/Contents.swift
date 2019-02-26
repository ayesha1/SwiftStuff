import Foundation


// Return a Boolean if there are 2 numbers in the array that equal a sum
let line = "BLANCHE:   I don't want realism. I want magic!"
print(line.split(separator: " "))

// 1. Brute Force - Nested For-Loop compare all (n2)





// 2. Binary Search for compliment (because its sorted) - n log n





// 3. Move pointer from either end -linear O(n)
let numbers3 = [1, 3, 6, 7, 7, 12, 14]

func twoSumPointers(array: [Int], sum: Int) -> Bool {
    var lowIndex = 0
    var highIndex = array.count - 1
    
    while lowIndex < highIndex {
        let sumOfItems = array[lowIndex] + array[highIndex]
        
        if sumOfItems == sum {
            print("Sum of \(array[lowIndex]) and \(array[highIndex])) = \(sum)")
            return true
        } else if sumOfItems < sum {
            lowIndex += 1
        } else if sumOfItems > sum {
            highIndex -= 1
        }
    }
    
    return false
}


func binarySearch(array: [Int], key: Int) -> Bool {
    if array.count == 0 { return false }
    
    let minIndex = 0
    let maxIndex = array.count - 1
    let midInedex = maxIndex/2
    let midValue = array[midInedex]
    
    if key < array[minIndex] || key > array[maxIndex] {
        return false
    }
    
    if key > midValue {
        let slice = Array(array[midInedex + 1...maxIndex])
        return binarySearch(array: slice, key: key)
    }
    
    
}

class Stack {
    var top: Node?
    
    func push(_ value: Int) {
        let oldTop = top
        top = Node(value: value)
        top?.next =
    }
    
}
