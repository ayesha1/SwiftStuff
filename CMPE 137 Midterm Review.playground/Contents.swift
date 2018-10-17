// ---------- RANGE -----------
//Floating point CountableRange
//(i = 0.5; i <= 15.25; i += 0.3) ?

for i in stride(from: 0.5, through: 15.25, by: 0.3) {
    //through since it's close ranged
    //if it was "to" it would be different
} // return type of stride is CountableRange (ClosedCountableRange since it's through)

//Countable Range is a generic type, doesn't have to be ints

// ---------- TUPLE -----------
//Tuple is a group of values
let x: (String, Int, Double) = ("Hello", 3, 0.3)
let (word, number, value) = x //tuple elements named when accessing the tuple
print(word)
print(number)
print(value)

//or elements in tuple can be named when tuple is declared
let x1: (word: String, number: Int, value: Double) = ("Hi", 5, 0.049)
print(x1.number)
print(x1.word)
print(x1.value)
let(wrd, num, val) = x1 //renames the tuple

//Q: Why compute value of a property?
//A: "Property" is "derived" from another state

// ---------- OPTIONAL -----------
//An optional is just an enum

enum Optional<T> {
    //a generic type like Array<Element> or Dictionary<Key,Value>
    case none
}
//let number01: Int? = Optional.some(42)
//let noNumber: Int? = Optional.none
//print(noNumber == nil)
// Prints "true"

// ? is used to declare optional
// ! is used to unwrap if an Optional is in "set" state

// if let index = cardButtons.index(of: Button)!
// ^declared with ! (instead of ?) will implicitly unwrap (add !) when accessed

//use ?? to create an expression to default to when an optional is not set
//return number ?? "?"

// use ? when accessing an optional to bail out an expression midstream

// Four essential Data Structure-building concepts in Swift
// Class, struct, enum, protocol

// ---------- CLASS -----------
// Supports OO design
// Single inheritance of both functionality and data (ie instance variables)
// Reference type
// - classes are stored in the heap and passed around via pointers
// Heap is automatically "kept clean" by swift
// - via reference counting, not garbage collection
// Ex. ViewController, UIButton, Concentration

// ---------- STRUCT -----------
// Value type
// Don't live in heap and are passed by copying them
// "copy on write"
// No inhertiance of data
// Mutability controlled by let
// Supports functional programming design

// ---------- ENUM -----------
// Value type (ie passed around by copying)
// Used for variables that have one discrete set of values
// "associated data" with discrete values
// No instance variable
// Can have methods and computed (only) properties

// ---------- PROTOCOL -----------
// A collection of methods and property declaration
// Type where declaration of functionality only
// No Value type or reference type
// Essentially provides multiple inheritence (of functionality only)
// What are protocols good for?
// A way to express an API more concisely
// Communication between the View and Controller (delegation)
// Sharing functionalities
// Multiple inheritance

// ---------- DELEGATION -----------
// "blind communication" between a View and its Controller
// 1. A View declares a delegation protocol (ie what view wants controller to do)
// 2. The View's API has a weak delegate property whose type is that delegation protocol
// 3. The View uses the delegate property to get/do things it can't own or control on its own
// 4. The Controller declares that it implements the protocol
// 5. The Controller sets delegate of the View to itself using the property of #2
// 6. The Controller implements the protocol (has a lot of optional methods in it)

// View is hooked up to Controller, but View has no idea what Controller is doing
// remains generic/reusability

weak var delegate: UIScrollViewDelegate? // Delegate Property

@objc protocol UIScrollViewDelegate {
    optional func scrollViewDidScroll(scrollView: UIScrollView)
    optional func viewForZooming(in scrollView: UIScrollView)
} // protocol

scrollView.delegate= self  // the Controller then would implement any of the protocol’s methods it is interested in.

// ---------- STRING -----------
// A string is made up of Unicodes
// A Character is made up of multiple Unicodes

//The characters in a string
let pizzaJoint = "café pesto"
let firstCharacterIndex = pizzaJoint.startIndex // of type String.Indexlet
let fourthCharacterIndex = pizzaJoint.index(firstCharacterIndex, offsetBy: 3)
let fourthCharacter = pizzaJoint[fourthCharacterIndex] // é

// ---------- NSATTRIBUTEDSTRING -----------
// Not mutable
// For mutability, use a subclasss NSMutableAttributedString
// Not the same thing as String, used from NSString

// ---------- ANY -----------
// Any and AnyObject are special types
// Any can hold any type
// AnyObject holds classes only
// Can't invoke a method on Any, you have to convert it to a concrete type
// Generally avoid any

func prepare(for segue: UIStoryboardSegue, sender: Any?) //not specified

//How do we use a variable of type Any?
//We can’t use it directly (since we don’t know what type it really is)
// Instead, we convert it to another, known type. as? for conversion
let unknown: Any //=.. // we can’t send unknown a message because it is typless
if let foo = unknown as? MyType {
    // for is of type MyTypein here
    // so we can invoke MyTypemethods or access MyTpevarsin foo
    // if unknown was not of type MyType, then we’ll never get here
}

// ---------- VIEW COORDINATE SYSTEM -----------
// Origin is upper left
// Units are in points, not pixels
// Points are the units in the coordinate system
// Most of the time, there are 2 pixels per point, but it could be only 1 or even 3
// How many pixels per point are there?  UIView’s var  contentScaleFactor: CGFloat
var  bounds: CGRect// a view’s internal drawing space’s origin and size
// This is the rectangle containing the drawing space in its own coordinate system

// Where is the UIView?
var  center: CGPoint// center of a UIViewin its superview’scoordinate system
var  frame: CGRect// rect  containing a UIViewin its superview’s coord.system

// ---------- UICOLOR -----------
// static type
var  backgroundColor: UIColor //background
// can have alpha (transperancy)
// 0 (transparent) 1.0 (opaque)
//If you want to draw in your view with transparency ...You must let the system know by setting theUIView
var  opaque = false
//You can make your entire UIViewtransparent
var alpha:CGFloat

//What happens when views overlap and have transparency?
//As mentioned, subviewslist order determines who is in front
//Lower ones (earlier in the array) can “show through” transparent views on top
//Transparency is not cheap, so use it wisely

//By default, when a UIView’sbounds changes, there is no redraw

// ---------- GESTURES -----------
//Gestures are recognized by instances of UIGestureRecognizer

//UIPanGestureRecognizer
//methods functranslationInView, velocityInView(view: UIView), setTranslation(translation: CGPoint, inView: UIView)
var state: UIGestureRecognizerState { get } //sits in .possible until it gets recognized


// ---------- UITABBARCONTROLLER -----------
var tabBarItem: UITabBarItem! //"badge value"

// If there are too many values, UITabBarController automatically presents a UI for overflow


// ---------- UISPLITVIEWCONTROLLER -----------
// Places two MVCs side-by-side
// Only do its thing properly in iPad
// The simplest  way to  wrap  a Navigation  Controller around  an  MVC  is with Editor->EmbedIn


// ---------- UINAVIGATIONCONTROLLER -----------
// Pushes and pops MVCs off of a stack
// Each MVC communicates these  contents via its  UIViewController’s  navigationItemproperty
// Back button automatically appears

//But how do you know you get hold of the SVC, TBC, or NC itself?
//Every UIViewController knows the Split View, Tab Bar or Navigation Controller it is currently in

// ---------- SEGUES -----------
// Causes other MVCs to appear

// Show Segue
// will push in a Navigation Controller

// Show Detail Segue
// will show in Detail of a split view or push Navigation Controller
// It'll be new instances

// Modal Segue
// Takes over entire screen

// Popover Segue
// little popover window

// Segues always create an INSTANCE of an MVC
// Going back no new instance

// Preparing for Segues
// It is crucial to understand that this preparation is happening BEFORE outlets get set!


// ---------- TIMER -----------

class func scheduledTimer(
    withTimeInterval: TimeInterval,
    repeats: Bool,
    block: (Timer) -> Void
    ) -> Timer

private weak var timer: Timer? //WEAK will keep strong as long as its scheduled

timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true) {timer in
    // our code here
}

// ---------- ANIMATION -----------

// Animating UIView Properties
// Changing things like the frame or transparency

//Animating Controller transitions (as in a UINavigationController)
//Same fundamental principles

//Core Animation
//Underlying powerful animation framework

//OpenGL and Metal
//3D

//SpriteKit
//“2.5D” animation - overlapping images moving around

//Dynamic Animation
//“Physics”-based animation


// ---------- UIVIEWANIMATION -----------

//UIViewAnimationOptions.transitionFlipFrom{Left,Right,Top,Bottom}
//Dissolve from old to new state .transitionCrossDissolveCurling up or down .transitionCurl{Up,Down}

// ---------- DYNAMICANIMATION -----------
var animator = UIDynamicAnimator(referenceView: UIView)

let gravity = UIGravityBehavior()
animator.addBehavior(gravity)
collider = UICollisionBehavior()
animator.addBehavior(collider)



/**
 The Model contains the data and what your app is.
 The View contains the visuals and output of information. Also your controller's minion
 The Controller has the business logic and communicates with the Model and the View. How your model is presented to the user.
 
 The Controller can speak directly to the Model and the View. The model and the view never speak to each other directly.
 
 The View can speak to the Controller in a "blind" manner. The controller can drop a target on itself. Then hand out an action to the View in which it can send when things happen in the UI.
 When the View needs to synchronize with the Controller, the Controller sets itself as the view's delegate. The delegate is set via a protocol ("Blind" access to class)
 
 Views don't own what they display, so they have a protocol to acquire it.
 Controllers are almost always the data source (not the Model!)
 Controllers interpret/format Model information for the View
 
 The model is UI independent, but when it updates, it uses a "radio station" like broadcast mechanism to communicate with the model.
 **/

