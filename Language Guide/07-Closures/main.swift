print("------ Chapter 07: Closures")

print("\n-------- Section: Closure Expressions")

print("\n---------- The Sorted Method\n")

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)
// reversedNames is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
print("reversedNames = \(reversedNames)")


print("\n---------- Closure Expression Syntax\n")

reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in return s1 > s2 } )
print("reversedNames = \(reversedNames)")


print("\n---------- Inferring Type From Context\n")

reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 } )
print("reversedNames = \(reversedNames)")


print("\n---------- Implicit Returns from Single-Expression Closures\n")

reversedNames = names.sorted(by: { s1, s2 in s1 > s2 } )
print("reversedNames = \(reversedNames)")


print("\n---------- Shorthand Argument Names\n")

reversedNames = names.sorted(by: { $0 > $1 } )
print("reversedNames = \(reversedNames)")


print("\n---------- Operator Methods\n")

reversedNames = names.sorted(by: >)
print("reversedNames = \(reversedNames)")


print("\n-------- Section: Trailing Closures\n")

func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}

// Here's how you call this function without using a trailing closure:

someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})

// Here's how you call this function with a trailing closure instead:
 
someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}

reversedNames = names.sorted() { $0 > $1 }

reversedNames = names.sorted { $0 > $1 }

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]

let strings = numbers.map {
    (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}
// strings is inferred to be of type [String]
// its value is ["OneSix", "FiveEight", "FiveOneZero"]
print("strings = \(strings)")


print("\n-------- Section: Capturing Values\n")

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
print(incrementByTen())
// returns a value of 10
print(incrementByTen())
// returns a value of 20
print(incrementByTen())
// returns a value of 30

let incrementBySeven = makeIncrementer(forIncrement: 7)
print(incrementBySeven())
// returns a value of 7

print(incrementByTen())
// returns a value of 40


print("\n-------- Section: Closures Are Reference Types\n")

let alsoIncrementByTen = incrementByTen
print(alsoIncrementByTen())
// returns a value of 50


print("\n-------- Section: Escaping Closures\n")

var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}

func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}
 
class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}
 
let instance = SomeClass()
instance.doSomething()
print(instance.x)
// Prints "200"

completionHandlers.first?() // call escaping closure through optional chaining
print(instance.x)
// Prints "100"


print("\n-------- Section: Autoclosures\n")

var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
// Prints "5"

let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count)
// Prints "5"
     
print("Now serving \(customerProvider())!")
// Prints "Now serving Chris!"
print(customersInLine.count)
// Prints "4"

// customersInLine is ["Alex", "Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } )
// Prints "Now serving Alex!"

// customersInLine is ["Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: customersInLine.remove(at: 0))
// Prints "Now serving Ewa!"

// customersInLine is ["Barry", "Daniella"]
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")
// Prints "Collected 2 closures."
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
// Prints "Now serving Barry!"
// Prints "Now serving Daniella!"
