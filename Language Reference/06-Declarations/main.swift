import Dispatch

print("------ Chapter 06: Declarations")

print("\n-------- Section: Type Alias Declaration\n")

typealias StringDictionary<Value> = Dictionary<String, Value>
 
// The following dictionaries have the same type.
var dictionary1: StringDictionary<Int> = [:]
var dictionary2: Dictionary<String, Int> = [:]

typealias DictionaryOfInts<Key: Hashable> = Dictionary<Key, Int>


print("\n-------- Section: Function Declaration")

print("\n---------- In-Out Parameters\n")

var x = 10
func f(a: inout Int, b: inout Int) {
    a += 1
    b += 10
}
//f(a: &x, b: &x) // Invalid, in-out arguments alias each other

func someFunction(a: inout Int) -> () -> Int {
    return { [a] in return a + 1 }
}

func someMutatingOperation(_ x: inout Int) {
    x += 1
}

func multithreadedFunction(queue: DispatchQueue, x: inout Int) {
    // Make a local copy and manually copy it back.
    var localX = x
    defer { x = localX }

    // Operate on localX asynchronously, then wait before returning.
    queue.async { someMutatingOperation(&localX) }
    queue.sync {}
}

var x2 = 1
multithreadedFunction(queue: DispatchQueue(label: "multithreaded"), x: &x2)
print(x2)


print("\n---------- Rethrowing Functions and Methods\n")

func someFunction(callback: () throws -> Void) rethrows {
    try callback()
}

enum SomeError: Error {
    case error
}

enum AnotherError: Error {
    case error
}

func alwaysThrows() throws {
    throw SomeError.error
}

func someFunction2(callback: () throws -> Void) rethrows {
    do {
        try callback()
        //try alwaysThrows()  // Invalid, alwaysThrows() isn't a throwing parameter
    } catch {
        throw AnotherError.error
    }
}


print("\n---------- Functions that Never Return\n")

func neverReturn() -> Never {
    fatalError("Never return")
}


print("\n-------- Section: Enumeration Declaration\n")

enum Number {
    case integer(Int)
    case real(Double)
}

let f = Number.integer
// f is a function of type (Int) -> Number

// Apply f to create an array of Number instances with integer values
let evenInts: [Number] = [0, 2, 4, 6].map(f)
print("evenInts = \(evenInts)")


print("\n-------- Section: Precedence Group Declaration\n")

precedencegroup CustomPrecedence {
    higherThan: TernaryPrecedence
    associativity: left
    assignment: false
}

precedencegroup CustomPrecedence2 {
    lowerThan: TernaryPrecedence
    associativity: right
    assignment: true
}
