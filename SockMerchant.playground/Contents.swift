import UIKit
import Foundation

func sockMerchant(n: Int, ar: [Int]) -> Int {
    //Have a dictionary where it keeps track of the numbers and how many times it appears
    var howManyColorAppearedDictionary: [Int: Int] = [:] //init
    
    //This loops keeps track of how many colors have appeared
    for colorNumber in ar {
        if let count = howManyColorAppearedDictionary[colorNumber] {
            howManyColorAppearedDictionary[colorNumber] = count + 1
        } else {
            howManyColorAppearedDictionary[colorNumber] = 1
        }
    }

        var evenNumbers = 0
    print(howManyColorAppearedDictionary)

        //Loop through and see how many even numbers
    for (colorNum, count) in howManyColorAppearedDictionary {
            if count != 1{ //count
                evenNumbers += count/2
            }
        }
    
        return evenNumbers
        
    }

sockMerchant(n: 10, ar: [1 ,1, 3, 1, 2, 1, 3, 3, 3, 3 ])
