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

//-- Strong Reference Cycles Between Class Instances
//Possible to write code where an instance of a class NEVER gets to a point where it has zero strong references.
// - If two classes hold a strong reference to each other
class Person1 {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment? //Optional, can be nil
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person1?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: Person1?
var unit4A: Apartment?

john = Person1(name: "John Appleseed") //john has a Strong reference to Person1
unit4A = Apartment(unit: "4A") //unit4A has a Strong reference to Apartment

john!.apartment = unit4A
unit4A!.tenant = john
//linking these two instances creates a Strong reference to the Person instance

john = nil
unit4A = nil
//deallocation does not happen even if you put these two instances as nil.

//-- Resolving Strong Reference Cycles Between Class Instances
//Weak references and unowned references
// - they refer to the other instance without keeping a strong hold on it
//   - because weak references need to allow their value to be changed to nil at runtime, they are variables, not constants

class Person2 {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment2?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment2 {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person2? //weak var
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john1: Person2?
var unit4A1: Apartment2?

john1 = Person2(name: "John Appleseed")
unit4A1 = Apartment2(unit: "4A")

john1!.apartment = unit4A1
unit4A1!.tenant = john1 // weak reference

john1 = nil
// Prints "John Appleseed is being deinitialized"
unit4A1 = nil
// Prints "Apartment 4A is being deinitialized"

//-- Unowned References
// same as weak, does not keep a strong hold to it
// but unlike weak, an unowned reference is used when
// the other instance has the same lifetime or a longer lifetime.

class Customer {
    let name: String
    var card: CreditCard? //instance of CreditCard
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer //
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}
