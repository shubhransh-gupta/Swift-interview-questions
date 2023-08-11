import UIKit

struct CarStruct {
    var name: String
    init(withName _name: String) {
        name = _name
    }
}

class Person {
     var objCar: CarStruct
    
    init(objCar: CarStruct) {
        self.objCar = objCar
    }
}

let car = CarStruct(withName: "Audi Q5")
  
  // both person and person2 are getting the same instance of car
  let person = Person(objCar: car)
  let person2 = Person(objCar: car)
  let p3 = person

  person.objCar.name = "Tesla"
  person2.objCar.name = "GMC"
  p3.objCar.name = "honda"

  print(person.objCar.name)
  print(person2.objCar.name)
  print(car.name)
