import UIKit

var str = "Hello, playground"

let numbers = [1, 2, 4, 5, 6, 7, 8, 9, 12, 15, 17]

func binarySearchForValue(searchValue: Int, array: [Int]) -> Bool {
    
    var leftIndex = 0
    var rightIndex = array.count - 1
    
    while leftIndex <= rightIndex {
        let middleIndex = (leftIndex + rightIndex) / 2
        let middleValue = array[middleIndex]
        
        print("middleValue: \(middleValue), leftIndex \(leftIndex), rightIndex: \(rightIndex), [\(array[leftIndex]), \(array[rightIndex])]")
        
        if middleValue == searchValue {
            return true
        }
        
        if searchValue < middleValue {
            rightIndex = middleIndex - 1
        }
        
        if searchValue > middleValue {
            leftIndex = middleValue + 1
        }
    }
    return false
}

print(binarySearchForValue(searchValue: 4, array: numbers))

func linearSearhForSearchValue(searchValue: Int, array:[Int]) -> Bool {
    for num in array {
        if num == searchValue {
            return true
        }
    }
    return true
}


linearSearhForSearchValue(searchValue: 2, array: numbers)

