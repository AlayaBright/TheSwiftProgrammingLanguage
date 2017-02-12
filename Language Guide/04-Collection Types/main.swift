print("------ Chapter 04: Collection Types")

print("\n-------- Section: Mutability of Collections\n")

var mutableArray = [1, 2, 3]
let immutableArray = [1, 2, 3]
print("mutableArray = \(mutableArray)")
print("immutableArray = \(immutableArray)")


print("\n-------- Section: Arrays")

print("\n---------- Array Type Shorthand Syntax\n")

let fullFormArray: Array<Int> = [1, 2, 3]
let shorthandFormArray: [Int] = [1, 2, 3]
print("fullFormArray = \(fullFormArray)")
print("shorthandFormArray = \(shorthandFormArray)")


print("\n---------- Creating an Empty Array\n")
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")
// Prints "someInts is of type [Int] with 0 items."

someInts.append(3)
// someInts now contains 1 value of type Int
print("someInts = \(someInts)")
someInts = []
// someInts is now an empty array, but is still of type [Int]
print("someInts = \(someInts)")


print("\n---------- Creating an Array with a Default Value\n")

var threeDoubles = Array(repeating: 0.0, count: 3)
// threeDoubles is of type [Double], and equals [0.0, 0.0, 0.0]
print("threeDoubles = \(threeDoubles)")


print("\n---------- Creating an Array by Adding Two Arrays Together\n")

var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// anotherThreeDoubles is of type [Double], and equals [2.5, 2.5, 2.5]
var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles is inferred as [Double], and equals [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
print("anotherThreeDoubles = \(anotherThreeDoubles)")
print("sixDoubles = \(sixDoubles)")


print("\n---------- Creating an Array with an Array Literal\n")

var shoppingList = ["Eggs", "Milk"]
// shoppingList has been initialized with two initial items
print("shoppingList = \(shoppingList)")


print("\n---------- Accessing and Modifying an Array\n")

print("The shopping list contains \(shoppingList.count) items.")
// Prints "The shopping list contains 2 items."

if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list is not empty.")
}
// Prints "The shopping list is not empty."

shoppingList.append("Flour")
// shoppingList now contains 3 items, and someone is making pancakes
print("shoppingList = \(shoppingList)")

shoppingList += ["Baking Powder"]
// shoppingList now contains 4 items
print("shoppingList = \(shoppingList)")
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
// shoppingList now contains 7 items
print("shoppingList = \(shoppingList)")

var firstItem = shoppingList[0]
// firstItem is equal to "Eggs"
print("firstItem = \(firstItem)")

shoppingList[0] = "Six eggs"
// the first item in the list is now equal to "Six eggs" rather than "Eggs"
print("shoppingList = \(shoppingList)")

shoppingList[4...6] = ["Bananas", "Apples"]
// shoppingList now contains 6 items
print("shoppingList = \(shoppingList)")

shoppingList.insert("Maple Syrup", at: 0)
// shoppingList now contains 7 items
// "Maple Syrup" is now the first item in the list
print("shoppingList = \(shoppingList)")

let mapleSyrup = shoppingList.remove(at: 0)
// the item that was at index 0 has just been removed
// shoppingList now contains 6 items, and no Maple Syrup
// the mapleSyrup constant is now equal to the removed "Maple Syrup" string
print("shoppingList = \(shoppingList)")
print("mapleSyrup = \(mapleSyrup)")

firstItem = shoppingList[0]
// firstItem is now equal to "Six eggs"
print("firstItem = \(firstItem)")


let apples = shoppingList.removeLast()
// the last item in the array has just been removed
// shoppingList now contains 5 items, and no apples
// the apples constant is now equal to the removed "Apples" string
print("shoppingList = \(shoppingList)")
print("apples = \(apples)")


print("\n---------- Iterating Over an Array\n")

for item in shoppingList {
    print(item)
}
// Six eggs
// Milk
// Flour
// Baking Powder
// Bananas

print()

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}
// Item 1: Six eggs
// Item 2: Milk
// Item 3: Flour
// Item 4: Baking Powder
// Item 5: Bananas


print("\n-------- Section: Sets")

print("\n---------- Hash Values for Set Types\n")


print("\n---------- Set Type Syntax\n")

var fullFormSets = Set<Int>()
print("fullFormSets = \(fullFormSets)")


print("\n---------- Creating and Initializing an Empty Set\n")

var letters = Set<Character>()
// Prints "letters is of type Set<Character> with 0 items."
print("letters is of type Set<Character> with \(letters.count) items.")

letters.insert("a")
// letters now contains 1 value of type Character
print("letters = \(letters)")
letters = []
// letters is now an empty set, but is still of type Set<Character>
print("letters = \(letters)")


print("\n---------- Creating a Set with an Array Literal\n")

var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
// favoriteGenres has been initialized with three initial items
print("favoriteGenres = \(favoriteGenres)")


print("\n---------- Accessing and Modifying a Set\n")

print("I have \(favoriteGenres.count) favorite music genres.")
// Prints "I have 3 favorite music genres."

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}
// Prints "I have particular music preferences."

favoriteGenres.insert("Jazz")
// favoriteGenres now contains 4 items
print("favoriteGenres = \(favoriteGenres)")

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}
// Prints "Rock? I'm over it."

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}
// Prints "It's too funky in here."


print("\n---------- Iterating Over a Set\n")

for genre in favoriteGenres {
    print("\(genre)")
}
// Jazz
// Hip hop
// Classical

print()

for genre in favoriteGenres.sorted() {
    print("\(genre)")
}
// Classical
// Hip hop
// Jazz


print("\n-------- Section: Performing Set Operations")

print("\n---------- Fundamental Set Operations\n")

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
 
let unionDigits = oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
print("oddDigits.union(evenDigits).sorted() = \(unionDigits)")
let intersectionDigits = oddDigits.intersection(evenDigits).sorted()
// []
print("oddDigits.intersection(evenDigits).sorted() = \(intersectionDigits)")
let subtractingDigits = oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
print("oddDigits.subtracting(singleDigitPrimeNumbers).sorted() = \(subtractingDigits)")
let symmetricDifferenceDigits = oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]
print("oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted() = \(symmetricDifferenceDigits)")


print("\n---------- Set Membership and Equality\n")

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]
 
print("houseAnimals.isSubset(of: farmAnimals) = \(houseAnimals.isSubset(of: farmAnimals))")
// true
print("farmAnimals.isSuperset(of: houseAnimals) = \(farmAnimals.isSuperset(of: houseAnimals))")
// true
print("farmAnimals.isDisjoint(with: cityAnimals) = \(farmAnimals.isDisjoint(with: cityAnimals))")
// true
print("houseAnimals.isStrictSubset(of: houseAnimals) = \(houseAnimals.isStrictSubset(of: houseAnimals))")
// false
print("houseAnimals.isStrictSuperset(of: houseAnimals) = \(houseAnimals.isStrictSuperset(of: houseAnimals))")
// false


print("\n-------- Section: Dictionaries")

print("\n---------- Dictionary Type Shorthand Syntax\n")

let fullFormDictionary: Dictionary<Int, String> = [1: "a", 2: "b", 3:"c"]
let shorthandFormDictionary: [Int: String] = [1: "a", 2: "b", 3:"c"]
print("fullFormDictionary = \(fullFormDictionary)")
print("shorthandFormDictionary = \(shorthandFormDictionary)")


print("\n---------- Creating an Empty Dictionary\n")

var namesOfIntegers = [Int: String]()
// namesOfIntegers is an empty [Int: String] dictionary
print("namesOfIntegers = \(namesOfIntegers)")

namesOfIntegers[16] = "sixteen"
// namesOfIntegers now contains 1 key-value pair
print("namesOfIntegers = \(namesOfIntegers)")
namesOfIntegers = [:]
// namesOfIntegers is once again an empty dictionary of type [Int: String]
print("namesOfIntegers = \(namesOfIntegers)")


print("\n---------- Creating a Dictionary with a Dictionary Literal\n")

var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
print("airports = \(airports)")


print("\n---------- Accessing and Modifying a Dictionary\n")

print("The airports dictionary contains \(airports.count) items.")
// Prints "The airports dictionary contains 2 items."

if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary is not empty.")
}
// Prints "The airports dictionary is not empty."

airports["LHR"] = "London"
// the airports dictionary now contains 3 items
print("airports = \(airports)")

airports["LHR"] = "London Heathrow"
// the value for "LHR" has been changed to "London Heathrow"
print("airports = \(airports)")

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
// Prints "The old value for DUB was Dublin."

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport is not in the airports dictionary.")
}
// Prints "The name of the airport is Dublin Airport."

airports["APL"] = "Apple International"
// "Apple International" is not the real airport for APL, so delete it
print("airports = \(airports)")
airports["APL"] = nil
// APL has now been removed from the dictionary
print("airports = \(airports)")

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary does not contain a value for DUB.")
}
// Prints "The removed airport's name is Dublin Airport."


print("\n---------- Iterating Over a Dictionary\n")

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
// YYZ: Toronto Pearson
// LHR: London Heathrow

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
// Airport code: YYZ
// Airport code: LHR

for airportName in airports.values {
    print("Airport name: \(airportName)")
}
// Airport name: Toronto Pearson
// Airport name: London Heathrow

let airportCodes = [String](airports.keys)
// airportCodes is ["YYZ", "LHR"]
let airportNames = [String](airports.values)
// airportNames is ["Toronto Pearson", "London Heathrow"]
print("airportCodes = \(airportCodes)")
print("airportNames = \(airportNames)")

for airportCode in airports.keys.sorted() {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values.sorted() {
    print("Airport name: \(airportName)")
}
