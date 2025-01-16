import Cocoa

var greeting = "Hello, playground"

func doSomething() {
    concurrentQueue.asyncAfter(deadline: .now() + 3, execute: {
        if Thread.isMainThread {
            print("Executing on the main thread")
        } else {
            print("Executing on a concurrent thread")
        }
    })

}

// Run on the main thread

// Create and run a concurrent thread
let concurrentQueue = DispatchQueue(label: "com.example.concurrentQueue")//, attributes: .concurrent)
concurrentQueue.sync {
    doSomething()
}
concurrentQueue.sync {
    print("123")
    for i in 0..<10 {
        print("123")
    }
}
