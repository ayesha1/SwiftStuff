import UIKit

// MERGE SORT

// Split Array
func mergeSort(array: [Int]) -> [Int] {
    
    //makes sure array is greater than 1
    guard array.count > 1 else {
        return array
    }
    
    let leftArray  = Array(array[0..<array.count/2]) //2 dots mean up to but not including the last element
    let rightArray = Array(array[array.count/2..<array.count]) //arrays start at index zero
    
    return merge(left: mergeSort(array: leftArray), right: mergeSort(array: rightArray))
}

// Merge Array
func merge(left: [Int], right: [Int]) -> [Int] { // these arrays are immutable
    
    var mergedArray: [Int] = []
    var left = left //makes these arrays mutable
    var right = right
    
    while left.count > 0 && right.count > 0 { //compare first elements and append that
        if left.first! < right.first! {
            mergedArray.append(left.removeFirst())
        } else {
            mergedArray.append(right.removeFirst())
        }
    }
    return mergedArray + left + right
}

var arr = [ 19, 30, 16, 13, 11, 45, 23, 1, 4]
print(arr)
print(mergeSort(array: arr))
