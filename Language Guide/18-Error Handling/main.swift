print("------ Chapter 18: Error Handling")

print("\n-------- Section: Representing and Throwing Errors\n")

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

//throw VendingMachineError.insufficientFunds(coinsNeeded: 5)


print("\n-------- Section: Handling Errors")

print("\n---------- Propagating Errors Using Throwing Functions\n")

func canThrowErrors() throws -> String {
    throw VendingMachineError.invalidSelection
}

func cannotThrowErrors() -> String {
    return ""
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0

    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }

        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }

        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }

        coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem

        print("Dispensing \(name)")
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

struct PurchasedSnack {
    let name: String

    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}


print("\n---------- Handling Errors Using Do-Catch\n")

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
}
// Prints "Insufficient funds. Please insert an additional 2 coins."


print("\n---------- Converting Errors to Optional Values\n")

func someThrowingFunction() throws -> Int {
    // ...
    return 1
}
 
let x = try? someThrowingFunction()
 
let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}

print("x = \(x!)")
print("y = \(y!)")

typealias Data = [Int]

enum IOError: Error {
    case noSuchFileOrDirectory
}

func fetchDataFromDisk() throws -> Data {
    throw IOError.noSuchFileOrDirectory
}

func fetchDataFromServer() throws -> Data {
    return [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
}

func fetchData() -> Data? {
    if let data = try? fetchDataFromDisk() { return data }
    if let data = try? fetchDataFromServer() { return data }
    return nil
}


print("\n---------- Disabling Error Propagation\n")

struct Photo {
    var path: String
}

func loadImage(atPath: String) throws -> Photo {
    if (atPath.isEmpty) { throw IOError.noSuchFileOrDirectory }
    return Photo(path: atPath)
}

let photo = try! loadImage(atPath: "./Resources/John Appleseed.jpg")
print("photo.path = \(photo.path)")


print("\n-------- Section: Specifying Cleanup Actions\n")

class File {
    var name: String

    init(name: String) {
        self.name = name
    }

    func readline() throws -> String? {
        return ""
    }
}

func exists(_ filename: String) -> Bool {
    return true
}

func open(_ filename: String) -> File {
    return File(name: filename)
}

func close(_ file: File) {
    file.name = ""
}

func processFile(filename: String) throws {
    if exists(filename) {
        let file = open(filename)
        defer {
            close(file)
        }
        while let line = try file.readline() {
            // Work with the file.
            print(line)
        }
        // close(file) is called here, at the end of the scope.
    }
}

func deferOrder() {
    defer {
        print("1")
        print("2")
    }

    defer {
        print("3")
        print("4")
    }
}

deferOrder()

print()

defer {
    print("5")
    print("6")
}

defer {
    print("7")
    print("8")
}
