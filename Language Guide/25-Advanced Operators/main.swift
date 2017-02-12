print("------ Chapter 25: Advanced Operators")

print("\n-------- Section: Bitwise Operators")

print("\n---------- Bitwise NOT Operator\n")

let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits  // equals 11110000
print("invertedBits = \(invertedBits)")


print("\n---------- Bitwise AND Operator\n")

let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8  = 0b00111111
let middleFourBits = firstSixBits & lastSixBits  // equals 00111100
print("middleFourBits = \(middleFourBits)")


print("\n---------- Bitwise OR Operator\n")

let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits  // equals 11111110
print("combinedbits = \(combinedbits)")


print("\n---------- Bitwise XOR Operator\n")

let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits  // equals 00010001
print("outputBits = \(outputBits)")


print("\n---------- Bitwise Left and Right Shift Operators")

print("\n------------ Shifting Behavior for Unsigned Integers\n")

let shiftBits: UInt8 = 4   // 00000100 in binary
print("shiftBits = \(shiftBits)")
print("shiftBits << 1 = \(shiftBits << 1)") // 00001000
print("shiftBits << 2 = \(shiftBits << 2)") // 00010000
print("shiftBits << 5 = \(shiftBits << 5)") // 10000000
print("shiftBits << 6 = \(shiftBits << 6)") // 00000000
print("shiftBits >> 2 = \(shiftBits >> 2)") // 00000001

print()

let pink: UInt32 = 0xCC6699
let redComponent = (pink & 0xFF0000) >> 16    // redComponent is 0xCC, or 204
let greenComponent = (pink & 0x00FF00) >> 8   // greenComponent is 0x66, or 102
let blueComponent = pink & 0x0000FF           // blueComponent is 0x99, or 153
print("redComponent = \(redComponent)")
print("greenComponent = \(greenComponent)")
print("blueComponent = \(blueComponent)")


print("\n------------ Shifting Behavior for Signed Integers\n")

print("-1 >> 1 = \(-1 >> 1)")
print("127 >> 1 = \(127 >> 1)")


print("\n-------- Section: Overflow Operators\n")

var potentialOverflow = Int16.max
// potentialOverflow equals 32767, which is the maximum value an Int16 can hold
//potentialOverflow += 1
// this causes an error
print("potentialOverflow = \(potentialOverflow )")


print("\n---------- Value Overflow\n")

var unsignedOverflow = UInt8.max
// unsignedOverflow equals 255, which is the maximum value a UInt8 can hold
unsignedOverflow = unsignedOverflow &+ 1
// unsignedOverflow is now equal to 0
print("unsignedOverflow = \(unsignedOverflow)")

unsignedOverflow = UInt8.min
// unsignedOverflow equals 0, which is the minimum value a UInt8 can hold
unsignedOverflow = unsignedOverflow &- 1
// unsignedOverflow is now equal to 255
print("unsignedOverflow = \(unsignedOverflow)")

var signedOverflow = Int8.min
// signedOverflow equals -128, which is the minimum value an Int8 can hold
signedOverflow = signedOverflow &- 1
// signedOverflow is now equal to 127
print("signedOverflow = \(signedOverflow)")


print("\n-------- Section: Precedence and Associativity\n")

print("2 + 3 % 4 * 5 = \(2 + 3 % 4 * 5)")
// this equals 17


print("\n-------- Section: Operator Methods\n")

struct Vector2D {
    var x = 0.0, y = 0.0
}

extension Vector2D {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector
// combinedVector is a Vector2D instance with values of (5.0, 5.0)
print("combinedVector = \(combinedVector)")


print("\n---------- Prefix and Postfix Operators\n")

extension Vector2D {
    static prefix func - (vector: Vector2D) -> Vector2D {
        return Vector2D(x: -vector.x, y: -vector.y)
    }
}

let positive = Vector2D(x: 3.0, y: 4.0)
let negative = -positive
// negative is a Vector2D instance with values of (-3.0, -4.0)
let alsoPositive = -negative
// alsoPositive is a Vector2D instance with values of (3.0, 4.0)
print("negative = \(negative)")
print("alsoPositive = \(alsoPositive)")


print("\n---------- Compound Assignment Operators\n")

extension Vector2D {
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
}

var original = Vector2D(x: 1.0, y: 2.0)
let vectorToAdd = Vector2D(x: 3.0, y: 4.0)
original += vectorToAdd
// original now has values of (4.0, 6.0)
print("original = \(original)")


print("\n---------- Equivalence Operators\n")

extension Vector2D {
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
    static func != (left: Vector2D, right: Vector2D) -> Bool {
        return !(left == right)
    }
}

let twoThree = Vector2D(x: 2.0, y: 3.0)
let anotherTwoThree = Vector2D(x: 2.0, y: 3.0)
if twoThree == anotherTwoThree {
    print("These two vectors are equivalent.")
}
// Prints "These two vectors are equivalent."


print("\n-------- Section: Custom Operators\n")

prefix operator +++

extension Vector2D {
    static prefix func +++ (vector: inout Vector2D) -> Vector2D {
        vector += vector
        return vector
    }
}

var toBeDoubled = Vector2D(x: 1.0, y: 4.0)
let afterDoubling = +++toBeDoubled
// toBeDoubled now has values of (2.0, 8.0)
// afterDoubling also has values of (2.0, 8.0)
print("toBeDoubled = \(toBeDoubled)")
print("afterDoubling = \(afterDoubling)")


print("\n---------- Precedence for Custom Infix Operators\n")

infix operator +-: AdditionPrecedence

extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y - right.y)
    }
}

let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 3.0, y: 4.0)
let plusMinusVector = firstVector +- secondVector
// plusMinusVector is a Vector2D instance with values of (4.0, -2.0)
print("plusMinusVector = \(plusMinusVector)")
