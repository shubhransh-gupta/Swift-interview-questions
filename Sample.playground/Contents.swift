import UIKit

//var greeting = "Hello, playground"

enum MyOptional<T> : ExpressibleByNilLiteral {
    
    case somevalue
    
    init(nilLiteral: ()) {
        MyOptional<T>.somevalue =
    }
    
    
    
}

struct Employee : ExpressibleByNilLiteral {
    
    init(nilLiteral: ()) {
        self.name = "Default"
    }
    
    var name : MyOptional<String> = .none
    
    init(name : String?) {
        self.name = name
    }
}

var e : Employee = Employee(name: nil)
e = nil
