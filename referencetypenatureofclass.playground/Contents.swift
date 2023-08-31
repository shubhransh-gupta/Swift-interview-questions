import UIKit

//struct CarStruct {
//    var name: String
//    init(withName _name: String) {
//        name = _name
//    }
//}
//
//class Person {
//     var objCar: CarStruct
//
//    init(objCar: CarStruct) {
//        self.objCar = objCar
//    }
//}
//
//let car = CarStruct(withName: "Audi Q5")
//
//  // both person and person2 are getting the same instance of car
//  let person = Person(objCar: car)
//  let person2 = Person(objCar: car)
//  let p3 = person
//
//  person.objCar.name = "Tesla"
//  person2.objCar.name = "GMC"
//  p3.objCar.name = "honda"
//
//  print(person.objCar.name)
//  print(person2.objCar.name)
//  print(car.name)

//var name : String {
//    get {
//        return "SHubh"
//    }
//}
//
//var name1 : String {
//    get {
//        return "SHubh"
//    }
//    set {
//        "value is set to \(newValue)"
//    }
//}
//print(name)
//print(name1)
////name = "Kaps"
//print(name)
//name1 = "Kaps"
//print(name1)

class School {
    var name : String?
    
    init(_ name : String) {
        self.name = name
    }
}

struct Student {
    var name : String?
    var school : School?
}

var a = Student.init(name: "Radha", school: School("radhe radhe"))
// b = a
var b : School? = a.school
print(a.school?.name)
a.school = School("ram ram")
print(a.school?.name)
print(b?.name)
a.school?.name = "shyam shyam"
print(a.school?.name)
print(b?.name)


