//ARC - Automatic Reference Counting
//A Simple class called Person which defines a stored constant property called name
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized") // where instance of a class is deallocated
    }
}

//Three variables of type Person
var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed") //Strong reference
// Prints "John Appleseed is being initialized"
//two more strong references
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
//breaks two strong references but Person is STILL not deallocated
//ARC does not deallocate until
reference3 = nil
// Prints "John Appleseed is being deinitialized"
