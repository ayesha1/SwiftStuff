import UIKit

var str = "Hello, playground"
//FROM BRIAN ADVENT
//https://www.youtube.com/watch?v=swz9fzL3QB8

let values = [2.0, 3.0, 4.0, 5.0, 6.0]

var squares: [Double] = []

for value in values {
    squares.append(value * value)
}

squares

//Map

let squaresWithMap = values.map { (value) -> Double in
    return value * value
}
squaresWithMap

let squaresWithMap2 = values.map{value in value * value}
squaresWithMap2

let squaresWithMap3 = values.map{$0 * $0}
squaresWithMap3

let amounts = [123, 11, 25, 234, 111]
let prices = amounts.map{"$\($0)"}
prices

struct Person {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let personDict = ["Steve": 47]
