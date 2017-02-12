print("------ Chapter 01: The Basics")

print("\n-------- Section: Constants and Variables")

print("\n---------- Declaring Constants and Variables\n")

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
print("maximumNumberOfLoginAttempts = \(maximumNumberOfLoginAttempts)")
print("currentLoginAttempt = \(currentLoginAttempt)")

var x = 0.0, y = 0.0, z = 0.0
print("x = \(x), y = \(y), z = \(z)")


print("\n---------- Type Annotations\n")

var welcomeMessage: String
welcomeMessage = "Hello"
print("welcomeMessage = \(welcomeMessage)")

var red, green, blue: Double
red = 0.0
green = 0.0
blue = 0.0
print("red = \(red), green = \(green), blue = \(blue)")


print("\n---------- Naming Constants and Variables\n")

let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"
print("π = \(π)")
print("你好 = \(你好)")
print("🐶🐮= = \(🐶🐮)")

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"
// friendlyWelcome is now "Bonjour!"
print("friendlyWelcome = \(friendlyWelcome)")

let languageName = "Swift"
//languageName = "Swift++"
// This is a compile-time error: languageName cannot be changed.
print("languageName = \(languageName)")


print("\n---------- Printing Constants and Variables\n")

print(friendlyWelcome)
// Prints "Bonjour!"
print("The current value of friendlyWelcome is \(friendlyWelcome)")
// Prints "The current value of friendlyWelcome is Bonjour!"


print("\n-------- Section: Comments\n")

// This is a comment.

/* This is also a comment
 but is written over multiple lines. */

/* This is the start of the first multiline comment.
  /* This is the second, nested multiline comment. */
  This is the end of the first multiline comment. */


print("\n-------- Section: Semicolons\n")

let cat = "🐱"; print(cat)
// Prints "🐱"


print("\n-------- Section: Integers")

print("\n---------- Integer Bounds\n")

let minValue = UInt8.min  // minValue is equal to 0, and is of type UInt8

let maxValue = UInt8.max  // maxValue is equal to 255, and is of type UInt8
print("minValue = \(minValue)")
print("maxValue = \(maxValue)")


print("\n---------- Int\n")

print("Int.min = \(Int.min)")
print("Int.max = \(Int.max)")


print("\n---------- UInt\n")

print("UInt.min = \(UInt.min)")
print("UInt.max = \(UInt.max)")


print("\n-------- Section: Floating-Point Numbers\n")

print(3.14159)
print(0.1)
print(-273.15)


print("\n-------- Section: Type Safety and Type Inference\n")

let meaningOfLife = 42
// meaningOfLife is inferred to be of type Int

let pi = 3.14159
// pi is inferred to be of type Double

let anotherPi = 3 + 0.14159
// anotherPi is also inferred to be of type Double

print("meaningOfLife = \(meaningOfLife)")
print("pi = \(pi)")
print("anotherPi = \(anotherPi)")


print("\n-------- Section: Numeric Literals\n")

let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation
print("decimalInteger = \(decimalInteger)")
print("binaryInteger = \(binaryInteger)")
print("octalInteger = \(octalInteger)")
print("hexadecimalInteger = \(hexadecimalInteger)")

print()

print("1.25e2 = \(1.25e2)")
print("1.25e-2 = \(1.25e-2)")
print("0xFp2 = \(0xFp2)")
print("0xFp-2 = \(0xFp-2)")

print()

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0
print("decimalDouble = \(decimalDouble)")
print("exponentDouble = \(exponentDouble)")
print("hexadecimalDouble = \(hexadecimalDouble)")

print()

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1
print("paddedDouble = \(paddedDouble)")
print("oneMillion = \(oneMillion)")
print("justOverOneMillion = \(justOverOneMillion)")


print("\n-------- Section: Numeric Type Conversion")

print("\n---------- Integer Conversion\n")

//let cannotBeNegative: UInt8 = -1
// UInt8 cannot store negative numbers, and so this will report an error

//let tooBig: Int8 = Int8.max + 1
// Int8 cannot store a number larger than its maximum value,
// and so this will also report an error

let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)
print("twoThousand = \(twoThousand)")
print("one = \(one)")
print("twoThousandAndOne = \(twoThousandAndOne)")


print("\n---------- Integer and Floating-Point Conversion\n")

let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi2 = Double(three) + pointOneFourOneFiveNine
// pi equals 3.14159, and is inferred to be of type Double
print("three = \(three)")
print("pointOneFourOneFiveNine = \(pointOneFourOneFiveNine)")
print("pi = \(pi2)")

print()

var integerPi = Int(3.14)
// integerPi equals 3, and is inferred to be of type Int
print("integerPi = \(integerPi)")

print()

print("Int(4.75) = \(Int(4.75))")
print("Int(-3.9) = \(Int(-3.9))")


print("\n-------- Section: Type Aliases\n")

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min
// maxAmplitudeFound is now 0
print("maxAmplitudeFound = \(maxAmplitudeFound)")


print("\n-------- Section: Booleans\n")

let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
	print("Mmm, tasty turnips!")
} else {
	print("Eww, turnips are horrible.")
}
// Prints "Eww, turnips are horrible."

let i = 1
//if i {
//    // this example will not compile, and will report an error
//}
if i == 1 {
    // this example will compile successfully
}


print("\n-------- Section: Tuples\n")

let http404Error = (404, "Not Found")
// http404Error is of type (Int, String), and equals (404, "Not Found")

let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
// Prints "The status code is 404"
print("The status message is \(statusMessage)")
// Prints "The status message is Not Found"

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
// Prints "The status code is 404"

print("The status code is \(http404Error.0)")
// Prints "The status code is 404"
print("The status message is \(http404Error.1)")
// Prints "The status message is Not Found"

let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
// Prints "The status code is 200"
print("The status message is \(http200Status.description)")
// Prints "The status message is OK"


print("\n-------- Section: Optionals\n")

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)
// convertedNumber is inferred to be of type "Int?", or "optional Int")
print("convertedNumber = \(convertedNumber)")


print("\n---------- nil\n")

var serverResponseCode: Int? = 404
// serverResponseCode contains an actual Int value of 404
print("serverResponseCode = \(serverResponseCode)")
serverResponseCode = nil
// serverResponseCode now contains no value
print("serverResponseCode = \(serverResponseCode)")

print()

var surveyAnswer: String?
// surveyAnswer is automatically set to nil
print("surveyAnswer = \(surveyAnswer)")


print("\n---------- If Statements and Forced Unwrapping\n")

if convertedNumber != nil {
    print("convertedNumber contains some integer value.")
}
// Prints "convertedNumber contains some integer value."

if convertedNumber != nil {
    print("convertedNumber has an integer value of \(convertedNumber!).")
}
// Prints "convertedNumber has an integer value of 123."


print("\n---------- Optional Binding\n")

if let actualNumber = Int(possibleNumber) {
    print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
    print("\"\(possibleNumber)\" could not be converted to an integer")
}
// Prints ""123" has an integer value of 123"

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}
// Prints "4 < 42 < 100"

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}
// Prints "4 < 42 < 100"


print("\n---------- Implicitly Unwrapped Optionals\n")

let possibleString: String? = "An optional string."
let forcedString: String = possibleString! // requires an exclamation mark
let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString // no need for an exclamation mark
print("possibleString = \(possibleString)")
print("forcedString = \(forcedString)")
print("assumedString = \(assumedString)")
print("implicitString = \(implicitString)")

if assumedString != nil {
    print(assumedString)
}
// Prints "An implicitly unwrapped optional string."

if let definiteString = assumedString {
    print(definiteString)
}
// Prints "An implicitly unwrapped optional string."


print("\n-------- Section: Error Handling\n")

func canThrowAnError() throws {
    // this function may or may not throw an error
    print("this function may or may not throw an error")
}

do {
    try canThrowAnError()
    // no error was thrown
    print("no error was thrown")
} catch {
    // an error was thrown
    print("an error was thrown")
}

print()

enum SandwichError: Error {
    case outOfCleanDishes
    case missingIngredients(ingredients: String)
}

func makeASandwich() throws {
    throw SandwichError.missingIngredients(ingredients: "some ingredients")
}

func eatASandwich() {
    print(#function)
}

func washDishes() {
    print(#function)
}

func buyGroceries(_ ingredients: String) {
    print("\(#function): \(ingredients)")
}
 
do {
    try makeASandwich()
    eatASandwich()
} catch SandwichError.outOfCleanDishes {
    washDishes()
} catch SandwichError.missingIngredients(let ingredients) {
    buyGroceries(ingredients)
}


print("\n-------- Section: Assertions")

print("\n---------- Debugging with Assertions\n")

let age = -3
assert(age >= 0, "A person's age cannot be less than zero")
// this causes the assertion to trigger, because age is not >= 0
assert(age >= 0)


print("\n---------- When to Use Assertions\n")
