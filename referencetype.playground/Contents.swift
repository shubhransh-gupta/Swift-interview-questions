import UIKit

//var greeting = "Hello, playground"

actor Person {
    var name : String?

    init(_ name: String) {
        self.name = name
    }
    
//    func changeName() {
//        self.name += "Ram"
//    }
}
//

var p1 = Person("Raja")
let p2 = p1

print(p1 === p2)
//
//var originalArray = [p1, p2, p1]
//var copiedArray = originalArray
//
//
//print(originalArray === copiedArray)
//print(originalArray) // Output: [1, 2, 3]
//print(copiedArray)
//let view1 = UIView()
//let view2 = UIView()
//
//let view3 = view1
//
//print(view1 === view2)  // false, because they are different instances
//print(view1 === view3)
