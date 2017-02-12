print("------ Chapter 24: Access Control")

print("\n-------- Section: Modules and Source Files\n")


print("\n-------- Section: Access Levels")

print("\n---------- Guiding Principle of Access Levels\n")


print("\n---------- Default Access Levels\n")


print("\n---------- Access Levels for Single-Target Apps\n")


print("\n---------- Access Levels for Frameworks\n")


print("\n---------- Access Levels for Unit Test Targets\n")


print("\n-------- Section: Access Control Syntax\n")

public class SomePublicClass0 {}
internal class SomeInternalClass0 {}
fileprivate class SomeFilePrivateClass0 {}
private class SomePrivateClass0 {}

public var somePublicVariable0 = 0
internal let someInternalConstant0 = 0
fileprivate func someFilePrivateFunction0() {}
private func somePrivateFunction0() {}

class SomeImplicitlyInternalClass {}             // implicitly internal
let someImplicitlyInternalConstant = 0           // implicitly internal


print("\n-------- Section: Custom Types")

public class SomePublicClass {                   // explicitly public class
    public var somePublicProperty = 0            // explicitly public class member
    var someInternalProperty = 0                 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

class SomeInternalClass {                        // implicitly internal class
    var someInternalProperty = 0                 // implicitly internal class member
    fileprivate func someFilePrivateMethod() {}  // explicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

fileprivate class SomeFilePrivateClass {         // explicitly file-private class
    func someFilePrivateMethod() {}              // implicitly file-private class member
    private func somePrivateMethod() {}          // explicitly private class member
}

private class SomePrivateClass {                 // explicitly private class
    func somePrivateMethod() {}                  // implicitly private class member
}


print("\n---------- Tuple Types\n")

fileprivate let tuple = (SomeInternalClass(), SomeFilePrivateClass())


print("\n---------- Function Types\n")

private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    // function implementation goes here
    return (SomeInternalClass(), SomePrivateClass())
}


print("\n---------- Enumeration Types")

public enum CompassPoint {
    case north
    case south
    case east
    case west
}


print("\n------------ Raw Values and Associated Values\n")


print("\n---------- Nested Types\n")

private class SomePrivateClass2 {
    class SomeNestedClass {}    // implicitly private
}

fileprivate class SomeFilePrivateClass2 {
    class SomeNestedClass {}    // implicitly file-private
}

internal class SomeInternalClass2 {
    class SomeNestedClass {}    // implicitly internal
}

public class SomePublicClass2 {
    class SomeNestedClass {}    // implicitly internal
}


print("\n-------- Section: Subclassing\n")

public class A {
    fileprivate func someMethod() {}
}

internal class B: A {
    override internal func someMethod() {
        super.someMethod()
    }
}


print("\n-------- Section: Constants, Variables, Properties, and Subscripts\n")

private var privateInstance = SomePrivateClass()


print("\n---------- Getters and Setters\n")

struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }
}

var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits."
stringToEdit.value += " So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")
// Prints "The number of edits is 3"

public struct TrackedString2 {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits += 1
        }
    }

    public init() {}
}


print("\n-------- Section: Initializers")

print("\n---------- Default Initializers\n")

// init() is implicitly file private
fileprivate class SomeFilePrivateClass3 {
    var a = 0
}


print("\n---------- Default Memberwise Initializers for Structure Types\n")

// init(a:b:) is implicitly file private
struct SomeInternalStruct {
    fileprivate var a: Int
    public var b: Int
}


print("\n-------- Section: Protocols")

print("\n---------- Protocol Inheritance\n")

fileprivate protocol SomeFilePrivateProtocol {
    func SomeMethod()
}

private protocol SomePrivateSubProtocol: SomeFilePrivateProtocol {
}


print("\n---------- Protocol Conformance\n")

public class SomePublicClass3: SomeFilePrivateProtocol {
    public func SomeMethod() {}
}

private class SomePrivateClass3: SomeFilePrivateProtocol {
    fileprivate func SomeMethod() {}
}

let someConst = SomePublicClass3()
private let someConst2 = SomePrivateClass3()


print("\n-------- Section: Extensions")

extension SomePublicClass {
    func someExtendedMethod() {}    // implicitly internel
}

extension SomeInternalClass {
    func someExtendedMethod() {}    // implicitly internel
}

extension SomeFilePrivateClass {
    func someExtendedMethod() {}    // implicitly file private
}

extension SomePrivateClass {
    func someExtendedMethod() {}    // implicitly private
}

private extension SomePublicClass {
    func someExtendedMethod2() {}
}


print("\n---------- Adding Protocol Conformance with an Extension\n")

extension SomePublicClass: SomeFilePrivateProtocol {
    public func SomeMethod() {
    }
}


print("\n-------- Section: Generics\n")


print("\n-------- Section: Type Aliases\n")

private typealias SomeNewPrivateClass = SomePublicClass
