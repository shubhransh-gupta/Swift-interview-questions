import UIKit


class Employee {
    fileprivate var fname : String?
    private var lname : String?
    
    init(_ f : String, _ l : String) {
        self.fname = f
        self.lname = l
    }
    
    fileprivate func getFname() -> String? {
        return self.fname
    }
    
    private func getLname() -> String? {
        return self.lname
    }
}

extension Employee {
    internal func getEmployeeFullName() {
        print(self.fname! + self.lname!)
    }
}

class Person : Employee {
    
    override init(_ name : String, _ nameTwo : String) {
        super.init(name, nameTwo)
    }
    
    fileprivate func printEmployee() -> String? {
        return self.fname! //+ self.lname!
    }
    
    override func getFname() -> String? {
        return (self.fname!)
    }
    
    //throws error
//    override func getLname() -> String? {
//        return (self.lname!)
//    }
    
}

let per = Person("Ram", "Singh")
print(per.printEmployee())
per.getEmployeeFullName()
