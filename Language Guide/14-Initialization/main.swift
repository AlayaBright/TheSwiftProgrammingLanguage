print("------ Chapter 14: Initialization")

print("\n-------- Section: Setting Initial Values for Stored Properties")

print("\n---------- Initializers\n")

struct Fahrenheit {
    var temperature: Double

    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")
// Prints "The default temperature is 32.0° Fahrenheit"


print("\n---------- Default Property Values\n")

struct Fahrenheit2 {
    var temperature = 32.0
}

print("Fahrenheit = \(Fahrenheit2())")


print("\n-------- Section: Customizing Initialization")

print("\n---------- Initialization Parameters\n")

struct Celsius {
    var temperatureInCelsius: Double

    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }

    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius is 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius is 0.0
print("boilingPointOfWater = \(boilingPointOfWater)")
print("freezingPointOfWater = \(freezingPointOfWater)")


print("\n---------- Parameter Names and Argument Labels\n")

struct Color {
    let red, green, blue: Double

    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }

    init(white: Double) {
        red   = white
        green = white
        blue  = white
    }
}

let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)
print("magenta = \(magenta)")
print("halfGray = \(halfGray)")

//let veryGreen = Color(0.0, 1.0, 0.0)
// this reports a compile-time error - argument labels are required


print("\n---------- Initializer Parameters Without Argument Labels\n")

struct Celsius2 {
    var temperatureInCelsius: Double

    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }

    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }

    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
}

let bodyTemperature = Celsius2(37.0)
// bodyTemperature.temperatureInCelsius is 37.0
print("bodyTemperature = \(bodyTemperature)")


print("\n---------- Optional Property Types\n")

class SurveyQuestion {
    var text: String
    var response: String?

    init(text: String) {
        self.text = text
    }

    func ask() {
        print(text)
    }
}

let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
// Prints "Do you like cheese?"
cheeseQuestion.response = "Yes, I do like cheese."
print(cheeseQuestion.response!)


print("\n---------- Assigning Constant Properties During Initialization\n")

class SurveyQuestion2 {
    let text: String
    var response: String?

    init(text: String) {
        self.text = text
    }

    func ask() {
        print(text)
    }
}

let beetsQuestion = SurveyQuestion2(text: "How about beets?")
beetsQuestion.ask()
// Prints "How about beets?"
beetsQuestion.response = "I also like beets. (But not with cheese.)"
print(beetsQuestion.response!)


print("\n-------- Section: Default Initializers\n")

class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()
print("item = \(item)")


print("\n---------- Memberwise Initializers for Structure Types\n")

struct Size {
    var width = 0.0, height = 0.0
}

let twoByTwo = Size(width: 2.0, height: 2.0)
print("twoByTwo = \(twoByTwo)")


print("\n-------- Section: Initializer Delegation for Value Types\n")

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()

    init() {}

    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }

    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}

let basicRect = Rect()
// basicRect's origin is (0.0, 0.0) and its size is (0.0, 0.0)

let originRect = Rect(origin: Point(x: 2.0, y: 2.0),
                      size: Size(width: 5.0, height: 5.0))
// originRect's origin is (2.0, 2.0) and its size is (5.0, 5.0)

let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
                      size: Size(width: 3.0, height: 3.0))
// centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)

print("basicRect = \(basicRect)")
print("originRect = \(originRect)")
print("centerRect = \(centerRect)")


print("\n-------- Section: Class Inheritance and Initialization")

print("\n---------- Designated Initializers and Convenience Initializers\n")


print("\n---------- Syntax for Designated and Convenience Initializers\n")


print("\n---------- Initializer Delegation for Class Types\n")


print("\n---------- Two-Phase Initialization\n")

class SomeClassA {
    var a: Int

    init(a: Int) {
        self.a = a
        print("\(type(of: self)).\(#function)")
    }
}

class SomeClassB: SomeClassA {
    var b: Int

    init(a: Int, b: Int) {
        self.b = b  // Safety check 1
        super.init(a: a)
        print("\(type(of: self)).\(#function)")
    }

    convenience init(b: Int) {
        self.init(a: 10, b: b)  // Safety check 3
        self.b += 2
        print("\(type(of: self)).\(#function)")
    }
}

class SomeClassC: SomeClassB {
    var c: Int

    init(a: Int, b: Int, c: Int) {
        self.c = c
        super.init(a: a, b: b)  // Safety check 2
        super.a += 1
        self.b += 1
        print("\(type(of: self)).\(#function)")
    }

    convenience init(b: Int, c: Int) {
        self.init(a: 10, b: b, c: c)
        print("\(type(of: self)).\(#function)")
    }

    convenience init(c: Int) {
        self.init(b: 20, c: c)  // Safety check 3
        self.c += 2
        print("\(type(of: self)).\(#function)")
    }
}

class SomeClassD: SomeClassC {
    var d: Int

    init(a: Int, b: Int, c: Int, d: Int) {
        self.d = d
        print("self.d = \(self.d)")     // Safety check 4
        super.init(a: a, b: b, c: c)
        print("\(type(of: self)).\(#function)")     // Safety check 4
        print("self.a = \(self.a)")     // Safety check 4
        self.someMethodD()  // Safety check 4
    }

    convenience init(b: Int, c: Int, d: Int) {
        self.init(a: 10, b: b, c: c, d: d)
        print("\(type(of: self)).\(#function)")
    }

    convenience init(c: Int, d: Int) {
        self.init(b: 20, c: c, d: d)
        print("\(type(of: self)).\(#function)")
    }

    convenience init(d: Int) {
        self.init(c: 30, d: d)
        print("\(type(of: self)).\(#function)")
    }

    func someMethodD() {
        print("call \(#function)")
    }
}

var someA = SomeClassA(a: 10)
print("someA.a = \(someA.a)")

print()

var someB = SomeClassB(b: 20)
print("someB.a = \(someB.a), someB.b = \(someB.b)")

print()

var someC = SomeClassC(c: 30)
print("someC.a = \(someC.a), someC.b = \(someC.b), someC.c = \(someC.c)")

print()

var someD = SomeClassD(d: 40)
print("someD.a = \(someD.a), someD.b = \(someD.b), someD.c = \(someD.c), someD.d = \(someD.d)")


print("\n---------- Initializer Inheritance and Overriding\n")

class SomeClassE: SomeClassB {
    var e: Int

    init(a: Int, b: Int, e: Int) {
        self.e = e
        super.init(a: a, b: b)
        print("\(type(of: self)).\(#function)")
    }

    override init(a: Int, b: Int) {
        self.e = 50
        super.init(a: a, b: b)
        print("\(type(of: self)).\(#function)")
    }

    convenience init(e: Int) {
        self.init(a: 10, b: 20, e: e)
        print("\(type(of: self)).\(#function)")
    }
}

class Vehicle {
    var numberOfWheels = 0

    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}

let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")
// Vehicle: 0 wheel(s)

class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")
// Bicycle: 2 wheel(s)


print("\n---------- Automatic Initializer Inheritance\n")

class SomeClassF: SomeClassE {
    var f: Int = 60     // Rule 1
}

var someF = SomeClassF(a: 10, b: 20, e: 50)
print("someF.a = \(someF.a), someF.b = \(someF.b), someF.e = \(someF.e), someF.f = \(someF.f)")
someF = SomeClassF(a: 10, b: 20)
print("someF.a = \(someF.a), someF.b = \(someF.b), someF.e = \(someF.e), someF.f = \(someF.f)")
someF = SomeClassF(e: 50)
print("someF.a = \(someF.a), someF.b = \(someF.b), someF.e = \(someF.e), someF.f = \(someF.f)")

print()

class SomeClassG: SomeClassE {
    var g: Int

    // Rule 2
    override init(a: Int, b: Int, e: Int) {
        self.g = 70
        super.init(a: a, b: b, e: e)
        print("\(type(of: self)).\(#function)")
    }

    // Rule 2
    override init(a: Int, b: Int) {
        self.g = 70
        super.init(a: a, b: b)
        print("\(type(of: self)).\(#function)")
    }
}

var someG = SomeClassG(e: 50)
print("someG.a = \(someG.a), someG.b = \(someG.b), someG.e = \(someG.e), someG.g = \(someG.g)")


print("\n---------- Designated and Convenience Initializers in Action\n")

class Food {
    var name: String

    init(name: String) {
        self.name = name
    }

    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

let namedMeat = Food(name: "Bacon")
// namedMeat's name is "Bacon"

let mysteryMeat = Food()
// mysteryMeat's name is "[Unnamed]"

print("namedMeat.name = \(namedMeat.name)")
print("mysteryMeat.name = \(mysteryMeat.name)")

class RecipeIngredient: Food {
    var quantity: Int

    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }

    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

let oneMysteryItem = RecipeIngredient()
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
print("oneMysteryItem.name = \(oneMysteryItem.name), oneMysteryItem.quantity = \(oneMysteryItem.quantity)")
print("oneBacon.name = \(oneBacon.name), oneBacon.quantity = \(oneBacon.quantity)")
print("sixEggs.name = \(sixEggs.name), sixEggs.quantity = \(sixEggs.quantity)")

print()

class ShoppingListItem2: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

var breakfastList = [
    ShoppingListItem2(),
    ShoppingListItem2(name: "Bacon"),
    ShoppingListItem2(name: "Eggs", quantity: 6),
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}
// 1 x Orange juice ✔
// 1 x Bacon ✘
// 6 x Eggs ✘


print("\n-------- Section: Failable Initializers\n")

struct Animal {
    let species: String

    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let someCreature = Animal(species: "Giraffe")
// someCreature is of type Animal?, not Animal

if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}
// Prints "An animal was initialized with a species of Giraffe"

let anonymousCreature = Animal(species: "")
// anonymousCreature is of type Animal?, not Animal

if anonymousCreature == nil {
    print("The anonymous creature could not be initialized")
}
// Prints "The anonymous creature could not be initialized"


print("\n---------- Failable Initializers for Enumerations\n")

enum TemperatureUnit {
    case kelvin, celsius, fahrenheit

    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}
// Prints "This is a defined temperature unit, so initialization succeeded."

let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}
// Prints "This is not a defined temperature unit, so initialization failed."


print("\n---------- Failable Initializers for Enumerations with Raw Values\n")

enum TemperatureUnit2: Character {
    case kelvin = "K", celsius = "C", fahrenheit = "F"
}

let fahrenheitUnit2 = TemperatureUnit2(rawValue: "F")
if fahrenheitUnit2 != nil {
    print("This is a defined temperature unit, so initialization succeeded.")
}
// Prints "This is a defined temperature unit, so initialization succeeded."

let unknownUnit2 = TemperatureUnit2(rawValue: "X")
if unknownUnit2 == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}
// Prints "This is not a defined temperature unit, so initialization failed."


print("\n---------- Propagation of Initialization Failure\n")

class Product {
    let name: String

    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class CartItem: Product {
    let quantity: Int

    init?(name: String, quantity: Int) {
        if quantity < 1 { return nil }
        self.quantity = quantity
        super.init(name: name)
    }
}

if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}
// Prints "Item: sock, quantity: 2"

if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialize zero shirts")
}
// Prints "Unable to initialize zero shirts"

if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialize one unnamed product")
}
// Prints "Unable to initialize one unnamed product"


print("\n---------- Overriding a Failable Initializer\n")

class Document {
    var name: String?

    // this initializer creates a document with a nil name value
    init() {}

    // this initializer creates a document with a nonempty name value
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }

    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}

var doc = Document(name: "Doc")
print("doc.name! = \(doc!.name!)")
var autoDoc = AutomaticallyNamedDocument(name: "NewDoc")
print("autoDoc.name! = \(autoDoc.name!)")
var untitledDoc = UntitledDocument()
print("untitledDoc.name! = \(untitledDoc.name!)")


print("\n---------- The init! Failable Initializer\n")


print("\n-------- Section: Required Initializers\n")

class SomeClass {
    var a: Int

    required init() {
        // initializer implementation goes here
        a = 1
        print("\(type(of: self)).\(#function)")
    }
}

class SomeSubclass: SomeClass {
    var b: Int

    required init() {
        // subclass implementation of the required initializer goes here
        b = 2
        super.init()
        print("\(type(of: self)).\(#function)")
    }

    init(b: Int) {
        self.b = b
        super.init()
        print("\(type(of: self)).\(#function)")
    }
}

var someVar = SomeClass()
var someSubVar = SomeSubclass(b: 2)


print("\n-------- Section: Setting a Default Property Value with a Closure or Function\n")

struct Chessboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...8 {
            for j in 1...8 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()

    func squareIsBlackAt(row: Int, column: Int) -> Bool {
        return boardColors[(row * 8) + column]
    }
}

let board = Chessboard()
print(board.squareIsBlackAt(row: 0, column: 1))
// Prints "true"
print(board.squareIsBlackAt(row: 7, column: 7))
// Prints "false"
