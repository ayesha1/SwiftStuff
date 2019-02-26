import UIKit

var str = "Hello, playground"

let sentence = "madam anna kayak notapalindrome anna Civic racecar"

//From Lets Build That App
// Implement a function that will tell me for each palindrome, how many times it occurs.
// ["Civic" : 1, "madam" : 1, "kayak" : 1, "anna" : 2, "racecar" : 1]

func allPalindromeCounts(sentence: String) -> [String: Int] {
    var counts = [String: Int]()
    let words = sentence.components(separatedBy: " ")
    
    for word in words {
        if isPalindrome(word: word) {
            let count = counts[word] ?? 0
            counts[word] = count + 1
//            print("\(word) is a Palindrome!")
        }
    }
    return counts
}

func isPalindrome(word: String) -> Bool {
    let characters = Array(word.lowercased())
    var currentIndex = 0
    
    while currentIndex < characters.count / 2 {
        if characters[currentIndex] != characters[characters.count - currentIndex - 1] {
            return false
        }
        currentIndex += 1
    }
    
    return true
}

let counts = allPalindromeCounts(sentence: sentence)
