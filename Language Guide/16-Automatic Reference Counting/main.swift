print("------ Chapter 16: Automatic Reference Counting")

print("\n-------- Section: How ARC Works\n")

class Person {
    let name: String

    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed")
// Prints "John Appleseed is being initialized"

reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil

reference3 = nil
// Prints "John Appleseed is being deinitialized"


print("\n-------- Section: Strong Reference Cycles Between Class Instances\n")

class Person2 {
    let name: String

    init(name: String) { self.name = name }

    var apartment: Apartment2?

    deinit { print("\(name) is being deinitialized") }
}

class Apartment2 {
    let unit: String

    init(unit: String) { self.unit = unit }

    var tenant: Person2?

    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john: Person2?
var unit4A: Apartment2?

john = Person2(name: "John Appleseed")
unit4A = Apartment2(unit: "4A")

john!.apartment = unit4A
unit4A!.tenant = john

john = nil
unit4A = nil


print("\n-------- Section: Resolving Strong Reference Cycles Between Class Instances")

print("\n---------- Weak References\n")

class Person3 {
    let name: String

    init(name: String) { self.name = name }

    var apartment: Apartment3?

    deinit { print("\(name) is being deinitialized") }
}

class Apartment3 {
    let unit: String

    init(unit: String) { self.unit = unit }

    weak var tenant: Person3?

    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john2: Person3?
var unit4A2: Apartment3?

john2 = Person3(name: "John Appleseed")
unit4A2 = Apartment3(unit: "4A")

john2!.apartment = unit4A2
unit4A2!.tenant = john2

john2 = nil
// Prints "John Appleseed is being deinitialized"

unit4A2 = nil
// Prints "Apartment 4A is being deinitialized"


print("\n---------- Unowned References\n")

class Customer {
    let name: String
    var card: CreditCard?

    init(name: String) {
        self.name = name
    }

    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned var customer: Customer

    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }

    deinit { print("Card #\(number) is being deinitialized") }
}

var johnC: Customer?

johnC = Customer(name: "John Appleseed")
johnC!.card = CreditCard(number: 1234_5678_9012_3456, customer: johnC!)

johnC = nil
// Prints "John Appleseed is being deinitialized"
// Prints "Card #1234567890123456 is being deinitialized"


print("\n---------- Unowned References and Implicitly Unwrapped Optional Properties\n")

class Country {
    let name: String
    var capitalCity: City!

    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country

    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

var country = Country(name: "Canada", capitalName: "Ottawa")
print("\(country.name)'s capital city is called \(country.capitalCity.name)")
// Prints "Canada's capital city is called Ottawa"


print("\n-------- Section: Strong Reference Cycles for Closures\n")

class HTMLElement {
    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}
print(heading.asHTML())
// Prints "<h1>some default text</h1>"

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
// Prints "<p>hello, world</p>"

paragraph = nil


print("\n-------- Section: Resolving Strong Reference Cycles for Closures")

print("\n---------- Defining a Capture List\n")

class SomeDelegate {
}

class SomeClass {
    var delegate: SomeDelegate?

    lazy var someClosure: (Int, String) -> String = {
        [unowned self, weak delegate = self.delegate!] (index: Int, stringToProcess: String) -> String in
        // closure body goes here
        return ""
    }

    lazy var someClosure2: () -> String = {
        [unowned self, weak delegate = self.delegate!] in
        // closure body goes here
        return ""
    }
}


print("\n---------- Weak and Unowned References\n")

class HTMLElement2 {
    let name: String
    let text: String?

    lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }

    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}

var paragraph2: HTMLElement2? = HTMLElement2(name: "p", text: "hello, world")
print(paragraph2!.asHTML())
// Prints "<p>hello, world</p>"

paragraph2 = nil
// Prints "p is being deinitialized"
