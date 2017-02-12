print("------ Chapter 03: Types")

print("\n-------- Section: Function Type\n")

func someFunction(left: Int, right: Int) {}
func anotherFunction(left: Int, right: Int) {}
func functionWithDifferentLabels(top: Int, bottom: Int) {}

var f = someFunction // The type of f is (Int, Int) -> Void, not (left: Int, right: Int) -> Void.
f = anotherFunction              // OK
f = functionWithDifferentLabels  // OK

func functionWithDifferentArgumentTypes(left: Int, right: String) {}
func functionWithDifferentNumberOfArguments(left: Int, right: Int, top: Int) {}

//f = functionWithDifferentArgumentTypes     // Error
//f = functionWithDifferentNumberOfArguments // Error

f(0, 1)


print("\n-------- Section: Array Type\n")

var array3D: [[[Int]]] = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]]
print("array3D = \(array3D)")


print("\n-------- Section: Optional Type\n")

var optionalInteger: Int?
var optionalInteger2: Optional<Int>


print("\n-------- Section: Implicitly Unwrapped Optional Type\n")

//let tupleOfImplicitlyUnwrappedElements: (Int!, Int!)  // Error
let implicitlyUnwrappedTuple: (Int, Int)!             // OK

//let arrayOfImplicitlyUnwrappedElements: [Int!]        // Error
let implicitlyUnwrappedArray: [Int]!                  // OK


print("\n-------- Section: Metatype Type\n")

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
// The compile-time type of someInstance is SomeBaseClass,
// and the runtime type of someInstance is SomeSubClass
type(of: someInstance).printClassName()
// Prints "SomeSubClass"

if type(of: someInstance) === someInstance.self {
    print("The dynamic and static type of someInstance are the same")
} else {
    print("The dynamic and static type of someInstance are different")
}
// Prints "The dynamic and static type of someInstance are different"

class AnotherSubClass: SomeBaseClass {
    let string: String
    required init(string: String) {
        self.string = string
    }
    override class func printClassName() {
        print("AnotherSubClass")
    }
}

let metatype: AnotherSubClass.Type = AnotherSubClass.self
let anotherInstance = metatype.init(string: "some string")

protocol SomeProtocol {
}

print(type(of: SomeProtocol.self))
