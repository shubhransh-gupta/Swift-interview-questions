import Cocoa

//var greeting = "Hello, playground"

actor Bank {
    let nominee : String = "___"
    var person : String?
    var balance : Double = 0

    init(_ person : String, _ bal : Double) {
        self.person = person
        self.balance = bal
    }

    func withDrawMoney(amt : Double) -> String {
        self.balance -= amt
        if self.balance < 0 {
            balance += amt
            return "Insufficient Balance"
        }
        return "Total Balance is \(self.balance)"
    }

    func depositMoney(amt : Double) -> String {
        self.balance += amt
        if amt == 0 {
            return "Insufficient Amount deposited"
        }
        return "Total Bal is \(self.balance)"
    }

}

let ram = Bank("Ram", 1000)
let q1 = DispatchQueue(label: "q1", attributes: .concurrent)
let q2 = DispatchQueue(label: "q2", attributes: .concurrent)

    q1.async {
        Task {
            var b = await ram.withDrawMoney(amt : 101)
            print(b)
        }
    }

    q1.async {
        Task {
            let b = await ram.depositMoney(amt : 100)
            print(b)
            sleep(3)
        }
    }

    q1.async {
     let t = Task {
            sleep(3)
            print(ram.nominee)
            await print(ram.person)
            var b = await ram.withDrawMoney(amt : 101)
            print(b)
        }


    }
  
//weak and unowned

class Person {
    var name : String?
    var apartment : Apartment?
    
    init(_ name : String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is no more")
    }
}

class Apartment {
    weak var tenant : Person?
    var address : String?
    init(_ address : String) {
        self.address = address
    }
    
    deinit {
        print("Apartmrent \(address) is vacant")
    }
    
}
var p : Person? = Person("ram")
var a : Apartment? = Apartment("Bangalore 2")

p!.apartment = a
a!.tenant = p

//p = nil
//a = nil

print(a?.tenant)

a = nil

print(p?.apartment)
