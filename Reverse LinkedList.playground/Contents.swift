import UIKit

class Node {
    let value: Int
    var next: Node?
    
    init(value: Int, next: Node?) {
        self.value = value
        self.next = next
    }
}

let threeNode = Node(value: 3, next: nil)
let twoNode = Node(value: 2, next: threeNode)
let oneNode = Node(value: 1, next: twoNode)

func printList(head: Node?) {
    var currNode = head
    while currNode != nil {
        print(currNode?.value ?? -1)
        currNode = currNode?.next
    }
}

//printList(head: oneNode)

func reverseList(head: Node?) -> Node?{
    var currNode = head
    var prev: Node?
    var next: Node?
    
    while currNode != nil {
        next = currNode?.next
        currNode?.next = prev
        prev = currNode
        currNode = next
    }
    return prev
}

var list = reverseList(head: oneNode)

printList(head: list)
