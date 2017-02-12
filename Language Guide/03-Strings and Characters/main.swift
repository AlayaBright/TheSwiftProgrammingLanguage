print("------ Chapter 03: Strings and Characters")

print("\n-------- Section: String Literals\n")

let someString = "Some string literal value"
print("someString = \(someString)")


print("\n-------- Section: Initializing an Empty String\n")

var emptyString = ""               // empty string literal
var anotherEmptyString = String()  // initializer syntax
// these two strings are both empty, and are equivalent to each other
print("emptyString = \(emptyString)")
print("anotherEmptyString = \(anotherEmptyString)")

if emptyString.isEmpty {
    print("Nothing to see here")
}
// Prints "Nothing to see here"


print("\n-------- Section: String Mutability\n")

var variableString = "Horse"
variableString += " and carriage"
// variableString is now "Horse and carriage"
print("variableString = \(variableString)")

let constantString = "Highlander"
//constantString += " and another Highlander"
// this reports a compile-time error - a constant string cannot be modified
print("constantString = \(constantString)")


print("\n-------- Section: Strings Are Value Types\n")


print("\n-------- Section: Working with Characters\n")

for character in "Dog!🐶".characters {
    print(character)
}
// D
// o
// g
// !
// 🐶

print()

let exclamationMark: Character = "!"
print("exclamationMark = \(exclamationMark)")

print()

let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
// Prints "Cat!🐱"


print("\n-------- Section: Concatenating Strings and Characters\n")

let string1 = "hello"
let string2 = " there"
var welcome0 = string1 + string2
// welcome now equals "hello there"
print("welcome = \(welcome0)")

var instruction = "look over"
instruction += string2
// instruction now equals "look over there"
print("instruction = \(instruction)")

welcome0.append(exclamationMark)
// welcome now equals "hello there!"
print("welcome = \(welcome0)")


print("\n-------- Section: String Interpolation\n")

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
// message is "3 times 2.5 is 7.5"
print("message = \(message)")


print("\n-------- Section: Unicode")

print("\n---------- Unicode Scalars\n")

let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
// "Imagination is more important than knowledge" - Einstein
let dollarSign = "\u{24}"        // $,  Unicode scalar U+0024
let blackHeart = "\u{2665}"      // ♥,  Unicode scalar U+2665
let sparklingHeart = "\u{1F496}" // 💖, Unicode scalar U+1F496
print("wiseWords = \(wiseWords)")
print("dollarSign = \(dollarSign)")
print("blackHeart = \(blackHeart)")
print("sparklingHeart = \(sparklingHeart)")


print("\n---------- Extended Grapheme Clusters\n")

let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"          // e followed by ́
// eAcute is é, combinedEAcute is é
print("eAcute = \(eAcute)")
print("combinedEAcute = \(combinedEAcute)")

let precomposed: Character = "\u{D55C}"                  // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"   // ᄒ, ᅡ, ᆫ
// precomposed is 한, decomposed is 한
print("precomposed = \(precomposed)")
print("decomposed = \(decomposed)")

let enclosedEAcute: Character = "\u{E9}\u{20DD}"
// enclosedEAcute is  é⃝
print("enclosedEAcute = \(enclosedEAcute)")

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
// regionalIndicatorForUS = 🇺🇸
print("regionalIndicatorForUS = \(regionalIndicatorForUS)")


print("\n---------- Counting Characters\n")

let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")
// Prints "unusualMenagerie has 40 characters"

var word = "cafe"
print("the number of characters in \(word) is \(word.characters.count)")
// Prints "the number of characters in cafe is 4"

word += "\u{301}"    // COMBINING ACUTE ACCENT, U+0301

print("the number of characters in \(word) is \(word.characters.count)")
// Prints "the number of characters in café is 4"


print("\n-------- Section: Accessing and Modifying a String")

print("\n---------- String Indices\n")

let greeting = "Guten Tag!"
let startChar = greeting[greeting.startIndex]
// G
print("greeting[greeting.startIndex] = \(startChar)")
let endChar = greeting[greeting.index(before: greeting.endIndex)]
// !
print("greeting[greeting.index(before: greeting.endIndex)] = \(endChar)")
let secondChar = greeting[greeting.index(after: greeting.startIndex)]
// u
print("greeting[greeting.index(after: greeting.startIndex)] = \(secondChar)")
let index = greeting.index(greeting.startIndex, offsetBy: 7)
// a
print("greeting.index(greeting.startIndex, offsetBy: 7) = \(greeting[index])")

//greeting[greeting.endIndex] // Error
//greeting.index(after: greeting.endIndex) // Error

for index in greeting.characters.indices {
    print("\(greeting[index]) ", terminator: "")
}
// Prints "G u t e n   T a g ! "
print("")


print("\n---------- Inserting and Removing\n")

var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
// welcome now equals "hello!"
print("welcome = \(welcome)")

welcome.insert(contentsOf:" there".characters, at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there!"
print("welcome = \(welcome)")

welcome.remove(at: welcome.index(before: welcome.endIndex))
// welcome now equals "hello there"
print("welcome = \(welcome)")
     
let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
// welcome now equals "hello"
print("welcome = \(welcome)")


print("\n-------- Section: Comparing Strings")

print("\n---------- String and Character Equality\n")

let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal.")
}
// Prints "These two strings are considered equal"

// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal.")
}
// Prints "These two strings are considered equal"

let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}"
if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent.")
}
// Prints "These two characters are not equivalent."


print("\n---------- Prefix and Suffix Equality\n")

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")
// Prints "There are 5 scenes in Act 1"

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
// Prints "6 mansion scenes; 2 cell scenes"


print("\n-------- Section: Unicode Representations of Strings\n")

let dogString = "Dog‼🐶"
print("dogString = \(dogString)")


print("\n---------- UTF-8 Representation\n")

for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// 68 111 103 226 128 188 240 159 144 182


print("\n---------- UTF-16 Representation\n")

for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 55357 56374 "


print("\n---------- Unicode Scalar Representation\n")

for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")
// Prints "68 111 103 8252 128054 "

print()

for scalar in dogString.unicodeScalars {
    print("\(scalar) ")
}
// D
// o
// g
// ‼
// 🐶
