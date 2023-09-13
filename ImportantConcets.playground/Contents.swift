import UIKit

//class MyClass {
//
//    required init() {
//        print("is created")
//    }
//
//    static func instantiate() -> Self {
//        return self.init()
//    }
//}
//
//let c = MyClass.instantiate()
//
//extension Int {
//    func doubleNumber() -> Self {
//        return self * self
//    }
//}
//
//let a = 2.doubleNumber()
//print(a)

final class Singleton {
    internal required init() {}
    
    static func createInstance() -> Self {
        return self.init()
    }
}

let a = Singleton.createInstance()
