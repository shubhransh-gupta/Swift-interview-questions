import UIKit

//var greeting = "Hello, playground"
//Single Responsibility Principle - This principle states that a class should have only one reason to change, meaning it should have only one responsibility.

// Bad Example: A class with multiple responsibilities
class Employee {
    func calculateSalary() { /* ... */ }
    func generateReport() { /* ... */ }
}

class SalaryCalculator {
    func calculateSalary() { /* ... */ }
}

class ReportGenerator {
    func generateReport() { /* ... */ }
}

//Open/Closed Principle (OCP):
//This principle states that software entities (classes, modules, functions) should be open for extension but closed for modification.

// Bad Example: Adding new shapes requires modifying existing code
class Square {
    func calculateArea() { /* ... */ }
}

class Circle {
    func calculateArea() { /* ... */ }
}

// Good Example: Using protocol and extensions for open/closed behavior
protocol Shape {
    func calculateArea() -> Double
}

extension Square: Shape {
    func calculateArea() -> Double { /* ... */ return 0}
}

extension Circle: Shape {
    func calculateArea() -> Double { /* ... */ return 0 }
}

//Liskov Substitution Principle (LSP):
//This principle states that objects of a superclass should be replaceable with objects of a subclass without affecting the correctness of the program.
//
//Example in Swift:

// Bad Example: Violating LSP
//class Bird {
//    func fly() { /* ... */ }
//}
//
//class Ostrich: Bird {
//    override func fly() {
//        // Ostriches can't fly, but we're overriding the method
//    }
//}
//
//// Good Example: Adhering to LSP
//protocol Bird {
//    func fly()
//}
//
//class Sparrow: Bird {
//    func fly() { /* ... */ }
//}
//
//class Ostrich: Bird {
//    func fly() {
//        // Ostriches can't fly, but we don't provide an implementation
//    }
//}

//Interface Segregation Principle (ISP):
//This principle states that clients should not be forced to depend on interfaces they do not use. It encourages smaller, more focused interfaces.
//
//Example in Swift:

// Bad Example: A large interface that clients need to implement entirely
protocol Worker {
    func work()
    func eat()
    func sleep()
}

// Good Example: Separating interfaces into smaller, more specific ones
protocol Workable {
    func work()
}

protocol Eatable {
    func eat()
}

protocol Sleepable {
    func sleep()
}

//Dependency Inversion Principle (DIP):
//This principle states that high-level modules should not depend on low-level modules. Both should depend on abstractions. Abstractions should not depend on details; details should depend on abstractions.
//
//Example in Swift:

protocol Switchable : AnyObject {
    func turnOn()
    func turnOff()
}

class Bulb : Switchable {
    
    var isBulbGlowing : Bool = false
    
    func turnOn() {
        isBulbGlowing = true
        print(isBulbGlowing)
    }
    
    func turnOff() {
        isBulbGlowing = false
        print(isBulbGlowing)
    }
    
}

class Switch {
    private let device: Switchable
    
    init(device: Switchable) {
        self.device = device
    }
    
    func turnOn() {
        device.turnOn()
    }
    
    func turnOff() {
        device.turnOff()
    }
}
let device = Bulb()
let switchA = Switch(device: device)

switchA.turnOff()
switchA.turnOn()
