import Foundation

print("------ Chapter 04: Expressions")

print("\n-------- Section: Primary Expressions\n")

print("---------- Literal Expression\n")

func logFunctionName(string: String = #function) {
    print(string)
}

func myFunction() {
    logFunctionName() // Prints "myFunction()".
}

func logFunction(file: String = #file, line: Int = #line, column: Int = #column, function: String = #function) {
    print("file \(file), line \(line), column \(column), function \(function)")
}

func someFunction(a: Int, b: Int) {
    logFunction()
}

someFunction(a: 1, b: 2)


print("\n---------- Closure Expression")

print("\n------------ Capture Lists\n")

var a = 0
var b = 0
let closure = { [a] in
    print(a, b)
}

a = 10
b = 10
closure()
// Prints "0 10"

class SimpleClass {
    var value: Int = 0
}
var x = SimpleClass()
var y = SimpleClass()
let closure2 = { [x] in
    print(x.value, y.value)
}
 
x.value = 10
y.value = 10
closure2()
// Prints "10 10"


print("\n---------- Selector Expression\n")

class SomeClass: NSObject {
    let property: String
    @objc(doSomethingWithInt:)
    func doSomething(_ x: Int) {}

    init(property: String) {
        self.property = property
    }
}

#if !os(Linux)

let selectorForMethod = #selector(SomeClass.doSomething(_:))
let selectorForPropertyGetter = #selector(getter: SomeClass.property)

extension SomeClass {
    @objc(doSomethingWithString:)
    func doSomething(_ x: String) { }
}

let anotherSelector = #selector(SomeClass.doSomething(_:) as (SomeClass) -> (String) -> Void)

#endif


print("\n---------- Key-Path Expression\n")

#if !os(Linux)

@objc class SomeClass2: NSObject {
    var someProperty: Int
    init(someProperty: Int) {
        self.someProperty = someProperty
    }
    func keyPathTest() -> String {
        return #keyPath(someProperty)
    }
}

let c = SomeClass2(someProperty: 12)
let keyPath = #keyPath(SomeClass2.someProperty)
print(keyPath == c.keyPathTest())
// Prints "true"

if let value = c.value(forKey: keyPath) {
    print(value)
}
// Prints "12"

#endif


print("\n---------- Initializer Expression\n")

class SomeType {
    var data: Int

    required init(data: Int) {
        self.data = data
    }
}

let s1 = SomeType.init(data: 3)  // Valid
let s2 = SomeType(data: 1)       // Also valid

let someValue = s2
let s3 = type(of: someValue).init(data: 7)  // Valid
//let s4 = type(of: someValue)(data: 5)     // Error


print("\n---------- Explicit Member Expression\n")

class SomeClass3 {
    func someMethod(x: Int, y: Int) {}
    func someMethod(x: Int, z: Int) {}
    func overloadedMethod(x: Int, y: Int) {}
    func overloadedMethod(x: Int, y: Bool) {}
}

let instance = SomeClass3()
 
//let a2 = instance.someMethod            // Ambiguous
let b2 = instance.someMethod(x:y:)        // Unambiguous
 
//let d2 = instance.overloadedMethod        // Ambiguous
//let d2 = instance.overloadedMethod(x:y:)  // Still ambiguous
let d2: (Int, Bool) -> Void  = instance.overloadedMethod(x:y:)  // Unambiguous

let x2 = [10, 3, 20, 15, 4]
    .sorted()
    .filter { $0 > 5 }
    .map { $0 * 100 }
print(x2)


print("\n---------- Postfix Self Expression\n")

var x3 = 1
print(x3.self)

print(SomeClass.self)


print("\n---------- Dynamic Type Expression\n")

class SomeBaseClass {
    class func printClassName() {
        print("SomeBaseClass")
    }
}

class SomeSubClass: SomeBaseClass {
    override class func printClassName() {
        print("SomeSubClass")
    }
}

let someInstance: SomeBaseClass = SomeSubClass()
// someInstance has a static type of SomeBaseClass at compile time, and
// it has a dynamic type of SomeSubClass at runtime
type(of: someInstance).printClassName()
// Prints "SomeSubClass"
