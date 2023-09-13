import UIKit

enum MyOptional<T> {
    case some(T)
    case none
    
    init(_ value : T?) {
        if let val = value {
            self  = .some(val)
        } else {
            self = .none
        }
    }
    
    var isSome : Bool {
        if case .some = self {
            return true
        }
        return false
    }
    //or you can directly say return !isSome for isNone
    var isNone : Bool {
        if case .none = self {
            return true
        } else {
            return false
        }
    }
    
    var value : T? {
        if case let .some(value) = self {
            return value
        }
        return nil
    }
    
    var unwrap : T {
        if case let .some(value) = self {
            return value
        }
        return fatalError("Unexpectedly found nil") as! T
    }
    
    func chain<U>(_ ops : ((T) -> MyOptional<U>)...) -> MyOptional<U> {
        var currentResult: MyOptional<U> = .none
        for op in ops {
            switch self {
            case .some(let val):
                currentResult = op(val)
            case .none:
                return .none
            }
        }
        return currentResult
    }

}



//let a : MyOptional<Int> = .some(4)
//print(a.unwrap)
//
//var b : MyOptional<String> = .some("Hello")
//print(b.value!)
//b = .none
//print(b)
//let a: MyOptional<Int> = .some(4)
//let result = a.chain { value in
//    return .some(value * 2)
//}
//print(result)

let a: MyOptional<Int> = .some(4)

let result = a.chain (
    { value in
        return .some(value * 2)
    },
    { value in
        return .some(value + 3)
    },
    { value in
        return .some(value / 2)
    }
)

print(result)
