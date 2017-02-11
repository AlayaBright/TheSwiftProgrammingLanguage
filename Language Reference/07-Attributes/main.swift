import Foundation

print("------ Chapter 07: Attributes")

print("\n-------- Section: Declaration Attributes\n")

// First release
//protocol MyProtocol {
//    // protocol definition
//}

// Subsequent release renames MyProtocol
protocol MyRenamedProtocol {
    // protocol definition
}

@available(*, unavailable, renamed: "MyRenamedProtocol")
typealias MyProtocol = MyRenamedProtocol

@available(iOS 10.0, macOS 10.12, *)
class MyClass {
    // class definition
}

@available(macOS, introduced: 10.10, deprecated: 10.12, obsoleted: 10.13, message: "hello", renamed: "MyNewClass")
class MyClass2 {
}

@available(macOS, unavailable)
class MyClass3 {
}

#if !os(Linux)

@objc
class ExampleClass: NSObject {
    var enabled: Bool {
        @objc(isEnabled) get {
            // Return the appropriate value
            return true
        }
    }
}

#endif
