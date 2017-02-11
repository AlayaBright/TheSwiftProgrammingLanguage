import Foundation

print("------ Chapter: A Swift Tour\n")

print("Hello, world!")


print("\n-------- Section: Simple Values\n")

var myVariable = 42
myVariable = 50
let myConstant = 42
print("myVariable = \(myVariable)")
print("myConstant = \(myConstant)")

print()

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
print("implicitInteger = \(implicitInteger)")
print("implicitDouble = \(implicitDouble)")
print("explicitDouble = \(explicitDouble)")

let explicitFloat: Float = 4
print("explicitFloat = \(explicitFloat)")

print()

let label = "The width is "
let width = 94
let widthLabel = label + String(width)
print("widthLabel = \(widthLabel)")

print()

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
print("appleSummary = \(appleSummary)")
print("fruitSummary = \(fruitSummary)")

let doubleOne = 1.0
let doubleTwo = 2.0
print("\(doubleOne) + \(doubleTwo) = \(doubleOne + doubleTwo)")

let someName = "John"
print("Hello, \(someName)!")

print()

var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"
print("shoppingList = \(shoppingList)")
 
var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"
print("occupations = \(occupations)")

print()

let emptyArray = [String]()
let emptyDictionary = [String: Float]()
print("emptyArray = \(emptyArray)")
print("emptyDictionary = \(emptyDictionary)")

shoppingList = []
occupations = [:]
print("shoppingList = \(shoppingList)")
print("occupations = \(occupations)")


print("\n-------- Section: Control Flow\n")

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

print()

var optionalString: String? = "Hello"
print(optionalString == nil)

print()
 
var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
print("greeting = \(greeting)")

optionalName = nil
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello, good morning"
}
print("greeting = \(greeting)")

print()

let nickName: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickName ?? fullName)"
print("informalGreeting = \(informalGreeting)")

print()

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

print()

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

largest = 0
var largestKind = ""
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            largestKind = kind
        }
    }
}
print("\(largestKind): \(largest)")

print()

var n = 2
while n < 100 {
    n = n * 2
}
print(n)

var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)

var total = 0
for i in 0..<4 {
    total += i
}
print(total)

total = 0
for i in 0...4 {
    total += i
}
print(total)


print("\n-------- Functions and Closures\n")

func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print(greet(person: "Bob", day: "Tuesday"))

func greet(person: String, lunchSpecial: String) -> String {
    return "Hello \(person), today's lunch special is \(lunchSpecial)."
}
print(greet(person: "Bob", lunchSpecial: "fish"))

func greet(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print(greet("John", on: "Wednesday"))

print()

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.2)

print()

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
print(sumOf())
print(sumOf(numbers: 42, 597, 12))

print()

func arithmeticMean(_ numbers: Double...) -> Double {
    if numbers.count == 0 {
        return 0
    }

    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
print(arithmeticMean())
print(arithmeticMean(1, 2, 3, 4, 5))

print()

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
print(returnFifteen())

print()

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
print(increment(7))

print()

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
print(hasAnyMatches(list: numbers, condition: lessThanTen))

print(numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
}))

print(numbers.map({
    (number: Int) -> Int in
    let result = ((number & 0x1) == 0) ? 3 * number : 0
    return result
}))

let mappedNumbers = numbers.map({ number in 3 * number })
print(mappedNumbers)

let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers)


print("\n-------- Section: Objects and Classes\n")

class Shape {
    var numberOfSides = 0

    let someConstantProperty = 0

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }

    func someMethod(param: Int) {
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
print("shapeDescription = \(shapeDescription)")

print()

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }

    func area() ->  Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2, name: "my test square")
print(test.area())
print(test.simpleDescription())

print()

class Circle: NamedShape {
    var radius: Double

    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
    }

    func area() -> Double {
        return Double.pi * radius * radius
    }

    override func simpleDescription() -> String {
        return "A circle with radius of \(radius)."
    }
}

let testCircle = Circle(radius: 2.0, name: "my test circle")
print(testCircle.area())
print(testCircle.simpleDescription())

print()

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

print()

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }

    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }

    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)

print()

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength
print("sideLength = \(sideLength)")


print("\n-------- Section: Enumerations and Structures\n")

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king

    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue
print("ace = \(ace)")
print("aceRawValue = \(aceRawValue)")

func equalRank(lhs: Rank, rhs: Rank) -> Bool {
    return lhs.rawValue == rhs.rawValue
}

print()

if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case spades, hearts, diamonds, clubs

    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }

    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}

let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
print("heartsDescription = \(heartsDescription)")

let heartsColor = hearts.color()
print("heartsColor = \(heartsColor)")

print()

enum ServerResponse {
    case result(String, String)
    case failure(String)
    case ok(String)
}
 
let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
 
switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
case let .ok(message):
    print("OK... \(message)")
}

print()

struct Card {
    var rank: Rank
    var suit: Suit

    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }

    static func createFullDeckOfCards() -> [Card] {
        let allRanks: [Rank] = [.ace, .two, .three, .four, .five, .six, .seven, .eight, .nine, .ten, .jack, .queen, .king]
        let allSuits: [Suit] = [.spades, .hearts, .diamonds, .clubs]
        var allCards: [Card] = []
        for suit in allSuits {
            for rank in allRanks {
                allCards.append(Card(rank: rank, suit: suit))
            }
        }
        return allCards
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
print("threeOfSpadesDescription = \(threeOfSpadesDescription)")


print("\n-------- Section: Protocols and Extensions\n")

protocol ExampleProtocol {
    var simpleDescription: String { get }

    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105

    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription
print("aDescription = \(aDescription)")

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"

    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription
print("bDescription = \(bDescription)")

enum SimpleEnum: ExampleProtocol {
    case odd, even

    var simpleDescription: String {
        switch self {
        case .odd:
            return "A simple enumeration with odd case"
        case .even:
            return "A simple enumeration with even case"
        }
    }

    mutating func adjust() {
        switch self {
        case .odd:
            self = .even
        case .even:
            self = .odd
        }
    }
}

var c = SimpleEnum.odd
c.adjust()
let cDescription = c.simpleDescription
print("cDescription = \(cDescription)")

print()

extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }

    mutating func adjust() {
        self += 42
    }
}

print(7.simpleDescription)

extension Double: ExampleProtocol {
    var simpleDescription: String {
        return "The absolute value of \(self) is \(absoluteValue)"
    }

    var absoluteValue: Double {
        return abs(self)
    }

    mutating func adjust() {
        self += 42.0
    }
}

print((-7.0).simpleDescription)

print()

let protocolValue: ExampleProtocol = a
print(protocolValue.simpleDescription)
// print(protocolValue.anotherProperty)  // Uncomment to see the error


print("\n-------- Section: Error Handling\n")

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}

do {
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error)
}

do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

print()

do {
    throw PrinterError.onFire
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

do {
    throw PrinterError.outOfPaper
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

enum AnotherPrinterError: Error {
    case anotherReason
}

do {
    throw AnotherPrinterError.anotherReason
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}

print()

let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }

    let result = fridgeContent.contains(food)
    return result
}
print(fridgeContains("banana"))
print(fridgeIsOpen)


print("\n-------- Section: Generics\n")

func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
print(makeArray(repeating: "knock", numberOfTimes:4))

print()

// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)
print("possibleInteger = \(possibleInteger)")

print()

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
print(anyCommonElements([1, 2, 3], [3]))

func getCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> [T.Iterator.Element]
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
    var commonElements: [T.Iterator.Element] = []
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                commonElements.append(lhsItem)
            }
        }
    }
    return commonElements 
}
print(getCommonElements([1, 2, 3], [2, 3, 4]))
