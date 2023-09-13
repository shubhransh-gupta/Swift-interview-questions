import UIKit

var greeting = "Hello, playground"

struct Employee {
    var id : Int?
    var name : String?
    
    mutating func changeID(id : Int) {
        self.id = id
    }
}

var e = Employee(id: 2, name : "Shubh")
e.changeID(id : 4)
print(e)


func checkEnquality(_ closure : @autoclosure () -> (Bool)) {
    if closure() {
        print("true")
    } else {
        print("false")
    }
}

checkEnquality(3 == 2)
