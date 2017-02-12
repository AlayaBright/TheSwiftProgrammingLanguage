print("------ Chapter 02: Basic Operators")

print("\n-------- Section: Terminology\n")

print("\n-------- Section: Assignment Operator\n")

let b = 10
var a = 5
a = b
// a is now equal to 10
print("a = \(a)")

let (x, y) = (1, 2)
// x is equal to 1, and y is equal to 2
print("x = \(x), y = \(y)")

//if x = y {
//    // This is not valid, because x = y does not return a value.
//}


print("\n-------- Section: Arithmetic Operators\n")

print("1 + 2 = \(1 + 2)")           // equals 3
print("5 - 3 = \(5 - 3)")           // equals 2
print("2 * 3 = \(2 * 3)")           // equals 6
print("10.0 / 2.5 = \(10.0 / 2.5)") // equals 4.0

print()

print("\"hello, \" + \"world\" = \("hello, " + "world")")   // equals "hello, world"


print("\n---------- Remainder Operator\n")

print("9 % 4 = \(9 % 4)")       // equals 1
print("-9 % 4 = \(-9 % 4)")     // equals -1
print("9 % -4 = \(9 % -4)")     // equals 1
print("-9 % -4 = \(-9 % -4)")   // equals -1


print("\n---------- Unary Minus Operator\n")

let three = 3
let minusThree = -three       // minusThree equals -3
let plusThree = -minusThree   // plusThree equals 3, or "minus minus three"
print("three = \(three)")
print("minusThree = \(minusThree)")
print("plusThree = \(plusThree)")


print("\n---------- Unary Plus Operator\n")

let minusSix = -6
let alsoMinusSix = +minusSix  // alsoMinusSix equals -6
print("minusSix = \(minusSix)")
print("alsoMinusSix = \(alsoMinusSix)")


print("\n-------- Section: Compound Assignment Operators\n")

a = 1
a += 2
// a is now equal to 3
print("a = \(a)")


print("\n-------- Section: Comparison Operators\n")

print("1 == 1 is \(1 == 1)")    // true because 1 is equal to 1
print("2 != 1 is \(2 != 1)")    // true because 2 is not equal to 1
print("2 > 1 is \(2 > 1)")      // true because 2 is greater than 1
print("1 < 2 is \(1 < 2)")      // true because 1 is less than 2
print("1 >= 1 is \(1 >= 1)")    // true because 1 is greater than or equal to 1
print("2 <= 1 is \(2 <= 1)")    // false because 2 is not less than or equal to 1

print()

let name = "world"
if name == "world" {
    print("hello, world")
} else {
    print("I'm sorry \(name), but I don't recognize you")
}
// Prints "hello, world", because name is indeed equal to "world".

print()

print("(1, \"zebra\") < (2, \"apple\") is \((1, "zebra") < (2, "apple"))")  // true because 1 is less than 2; "zebra" and "apple" are not compared
print("(3, \"apple\") < (3, \"bird\") is \((3, "apple") < (3, "bird"))")    // true because 3 is equal to 3, and "apple" is less than "bird"
print("(4, \"dog\") == (4, \"dog\") is \((4, "dog") == (4, "dog"))")        // true because 4 is equal to 4, and "dog" is equal to "dog"


print("\n-------- Section: Ternary Conditional Operator\n")

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)
// rowHeight is equal to 90
print("rowHeight = \(rowHeight)")


print("\n-------- Section: Nil-Coalescing Operator\n")

let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"
print("colorNameToUse = \(colorNameToUse)")

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is not nil, so colorNameToUse is set to "green"
print("colorNameToUse = \(colorNameToUse)")


print("\n-------- Section: Range Operators")

print("\n---------- Closed Range Operator\n")

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25


print("\n---------- Half-Open Range Operator\n")

let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
// Person 1 is called Anna
// Person 2 is called Alex
// Person 3 is called Brian
// Person 4 is called Jack


print("\n-------- Section: Logical Operators")

print("\n---------- Logical NOT Operator\n")

let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"


print("\n---------- Logical AND Operator\n")

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "ACCESS DENIED"


print("\n---------- Logical OR Operator\n")

let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"


print("\n---------- Combining Logical Operators\n")

if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"


print("\n---------- Explicit Parentheses\n")

if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED")
}
// Prints "Welcome!"

print()

let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}
// Prints "e is a vowel"
