import Foundation

class TreeNode<T> {
    
    var data: T
    var leftNode: TreeNode?
    var rightNode: TreeNode?
    
    init(data: T, leftNode: TreeNode? = nil, rightNode: TreeNode? = nil) {
        self.data = data
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}
