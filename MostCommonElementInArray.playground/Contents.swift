
import UIKit
import Foundation

var colorArray = ["red", "red", "green", "green", "black", "blue", "yellow", "red", "green", "yellow", "red", "red", "green", "green", "grey", "purple", "orange", "grey", "blue", "red", "green", "yellow", "orange", "purple", "black", "red", "blue", "green", "orange", "blue", "white", "yellow", "blue", "red", "green", "orange", "purple", "blue", "black"]

func getMostCommonColor(array: [String]) -> [String] {
    var topColors: [String] = []
    var colorDictionary: [String: Int] = [:]
    
    for color in array {
        colorDictionary[color, default:0] += 1
    }
    
    let highestValue = colorDictionary.values.max()
    
    for (color, count) in colorDictionary {
        if colorDictionary[color] == highestValue {
            topColors.append(color)
        }
    }
    
    return topColors
}

getMostCommonColor(array: colorArray)

var k = 3
var arrayOfk : [Int] = []
for i in 1...k {
    arrayOfk.append(i)
}

print(arrayOfk)


//permutation

var x = 5/2

func isValid(a: [Int]) -> String {
    // Write your code here
    //left subtree
    //right subtree
    let yes = "YES"
    let no = "NO"
    var returnVal = yes
    var countOfNodes = a.count
    var root = a[0]
    
    var rightTree = Array(a[a.count/2..<a.count])
    
    var leftTree = Array(a[1..<a.count/2])
    
    return returnVal
}

func reverseList(head: Node?) -> Node? {
    var currentNode = head
    var prev: Node?
    var next:Node?
    
    while currentNode != nil {
        next = currentNode.next
        currentNode.next = prev
        prev = currentNode
        currentNode = next
    }
    return prev
}
