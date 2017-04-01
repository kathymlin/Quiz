//: Playground - noun: a place where people can play

import UIKit


// there are 3 types in Swift: structures, classes, enumerations.  all three can have
// - properties: values associated with a type
// - initializers: code that initializes an instance of a type
// - instance methods: functions specific to a type that can be called on an instance of that type
// - class / static method: functions specific to a type that can be called on the type itself

var str = "Hello, playground"
str = "Hello Swift"

// type inference. Option+click to see what type is inferred. let = constant
let constStr = str

// NUMBER AND BOOLEAN TYPES
var nextYear: Int    // integer
var bodyTemp: Float  // floating point. Float is for 32 bit, Double for 64 bit, FLoat80 for 80 bit
var hasPet: Bool     // true / false

// COLLECTION TYPES

// Arrays; strongly typed, ordered collection of elements
var arrayOfInts: Array<Int>  // An array of integers
var arrayOfIntsAlt: [Int]      // another way to delcaring an array

// Dictionary: unordered collection, key value pairs. keys must be unique & hashable.  strongly typed.
var dictionaryOfCapitalsByCountry: Dictionary<String, String>
var dictionaryOfCapitalsByCountryAlt: [String:String]

// Sets.  Unordered collection, members must be unique & hashable
var winningLotteryNumbers: Set<Int>

// literals 
let number = 42
let fmstation = 91.1
var countingUp = ["one", "two"]
let nameByParkingSpace = [13: "Alice", 27: "Bob"]

// subscripting
let secondElement = countingUp[1]

// INITIALIZERS
let emptyString = String()
let emptyArrayOfInts = [Int]()
let emptySetOfFloats = Set<Float>()

let defaultNumber = Int()
let defaultBool = Bool()

let meaningOfLife = String(number)
let availableRooms = Set([205, 411, 412])

let DefaultFloat = Float()
let floatFromLiteral = Float(3.14)

let easyPi = 3.14
let floatfromDouble = Float(easyPi)
let floatingPi: Float = 3.14

// PROPERTIES
// a value associated with an instance of a type

countingUp.count
emptyString.isEmpty

// INSTANCE METHODS
// a fucntion that is specific to a particular type and can be called on that type
countingUp.append("three")

// OPTIONALS
// indicated by adding a ? to a type name

var anOptionalFloat: Float?
var anOptionalArrayOfStrings: [String]?
var anOptionalArrayOfOtionalstrings: [String?]?

var reading1: Float?
var reading2: Float?
var reading3: Float?

reading1 = 9.8
reading2 = 9.2
reading3 = 9.7

//  forcible unwrapping with a ! can be dangerous b/c it does not account for nil
//let avgReading = (reading1! + reading2! + reading3!)/3

if  let r1 = reading1,
    let r2 = reading2,
    let r3 = reading3 {
    let avgReading = (r1 + r2 + r3) / 3
} else {
    let errorString = "Instrument reported a reading that was nil"
}

// Subscripting dictionaries

let space13Assignee: String? = nameByParkingSpace[13]
let space42Assignee: String? = nameByParkingSpace[42]

if let space13Assignee = nameByParkingSpace[13] {
    print("Key 13 is assigned in the dictionary!")
}

// LOOPS AND STRING INTERPOLATION

// there are no traditional C-style for loops, but for..in and range

let range = 0..<countingUp.count
for i in range {
    let string = countingUp[i]
    // Use 'string'
}

for string in countingUp {
    // use string
}

for (i, string) in countingUp.enumerated() {
    // (0, "one"), (1, "two")
    print((i,string))
}

// swift string interpolation. expressions enclosed between \( and ) are evaluated and inserted into a string at runtime
for (space, name) in nameByParkingSpace {
    let permit = "Space \(space): \(name)"
}

// ENUMERATIONS AND THE SWITCH STATEMENT
// an enumeration is a type with a discrete set of values. 