print("------ Chapter 05: Statements")

print("\n-------- Section: Compiler Control Statements")

print("\n---------- Conditional Compilation Block\n")

#if os(macOS)
print("macOS")
#elseif os(Linux)
print("Linux")
#else
print("Other OS")
#endif

#if arch(x86_64)
print("x86_64")
#else
print("Other arch")
#endif

#if swift(>=3.0.1)
print("swift >= 3.0.1")
#else
print("swift < 3.0.1")
#endif


print("\n---------- Line Control Statement\n")

#sourceLocation(file: "main.swift", line: 30)
#sourceLocation()
