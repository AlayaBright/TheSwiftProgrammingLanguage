print("------ Chapter 11: Methods")

print("\n-------- Section: Instance Methods\n")

class Counter {
    var count = 0

    func increment() {
        count += 1
    }

    func increment(by amount: Int) {
        count += amount
    }

    func reset() {
        count = 0
    }
}

let counter = Counter()
// the initial counter value is 0
print("counter.count = \(counter.count)")
counter.increment()
// the counter's value is now 1
print("counter.count = \(counter.count)")
counter.increment(by: 5)
// the counter's value is now 6
print("counter.count = \(counter.count)")
counter.reset()
// the counter's value is now 0
print("counter.count = \(counter.count)")


print("\n---------- The self Property\n")

struct Point {
    var x = 0.0, y = 0.0

    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}

let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}
// Prints "This point is to the right of the line where x == 1.0"


print("\n---------- Modifying Value Types from Within Instance Methods\n")

struct Point2 {
    var x = 0.0, y = 0.0

    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}

var somePoint2 = Point2(x: 1.0, y: 1.0)
somePoint2.moveBy(x: 2.0, y: 3.0)
print("The point is now at (\(somePoint2.x), \(somePoint2.y))")
// Prints "The point is now at (3.0, 4.0)"

let fixedPoint = Point2(x: 3.0, y: 3.0)
//fixedPoint.moveBy(x: 2.0, y: 3.0)
// this will report an error


print("\n---------- Assigning to self Within a Mutating Method\n")

struct Point3 {
    var x = 0.0, y = 0.0

    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point3(x: x + deltaX, y: y + deltaY)
    }
}

var somePoint3 = Point3(x: 1.0, y: 1.0)
somePoint3.moveBy(x: 2.0, y: 3.0)
print("somePoint = \(somePoint3)")

print()

enum TriStateSwitch {
    case off, low, high

    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}

var ovenLight = TriStateSwitch.low
ovenLight.next()
// ovenLight is now equal to .high
print("ovenLight = \(ovenLight)")
ovenLight.next()
// ovenLight is now equal to .off
print("ovenLight = \(ovenLight)")


print("\n-------- Section: Type Methods\n")

class SomeClass {
    class func someTypeMethod() {
        // type method implementation goes here
    }
}

SomeClass.someTypeMethod()

struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }

    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }

    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String

    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }

    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.complete(level: 1)
print("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
// Prints "highest unlocked level is now 2"

player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}
// Prints "level 6 has not yet been unlocked"
