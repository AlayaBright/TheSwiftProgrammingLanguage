print("------ Chapter 09: Classes and Structures")

print("\n-------- Section: Comparing Classes and Structures")

print("\n---------- Definition Syntax\n")

class SomeClass {
    // class definition goes here
}

struct SomeStructure {
    // structure definition goes here
}

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}


print("\n---------- Class and Structure Instances\n")

let someResolution = Resolution()
let someVideoMode = VideoMode()


print("\n---------- Accessing Properties\n")

print("The width of someResolution is \(someResolution.width)")
// Prints "The width of someResolution is 0"

print("The width of someVideoMode is \(someVideoMode.resolution.width)")
// Prints "The width of someVideoMode is 0"

someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
// Prints "The width of someVideoMode is now 1280"


print("\n---------- Memberwise Initializers for Structure Types\n")

let vga = Resolution(width: 640, height: 480)
print("vga = \(vga)")


print("\n-------- Section: Structures and Enumerations Are Value Types\n")

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048
print("cinema is now \(cinema.width) pixels wide")
// Prints "cinema is now 2048 pixels wide"
print("hd is still \(hd.width) pixels wide")
// Prints "hd is still 1920 pixels wide"

print()

enum CompassPoint {
    case north, south, east, west
}

var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
currentDirection = .east
if rememberedDirection == .west {
    print("The remembered direction is still .west")
}
// Prints "The remembered direction is still .west"


print("\n-------- Section: Classes Are Reference Types\n")

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0

print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
// Prints "The frameRate property of tenEighty is now 30.0"


print("\n---------- Identity Operators\n")

if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
// Prints "tenEighty and alsoTenEighty refer to the same VideoMode instance."


print("\n---------- Pointers\n")


print("\n-------- Section: Choosing Between Classes and Structures\n")


print("\n-------- Section: Assignment and Copy Behavior for Strings, Arrays, and Dictionaries\n")
