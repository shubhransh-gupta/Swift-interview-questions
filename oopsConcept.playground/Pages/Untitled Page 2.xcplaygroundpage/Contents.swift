
import Foundation

var greeting = "Hello, playground"

struct Pizza {
  let ingredients: [String]
}

protocol Pizzeria {
  func makePizza(_ ingredients: [String]) -> Pizza

  func makeMargherita() -> Pizza
}

extension Pizzeria {
  func makeMargherita() -> Pizza {
    return makePizza(["tomato", "mozzarella"])
  }

}


struct MyRestaurent: Pizzeria {
  func makePizza(_ ingredients: [String]) -> Pizza {
    return Pizza(ingredients: ingredients)
  }

  func makeMargherita() -> Pizza {
    return makePizza(["tomato", "basil", "mozzarella"])
  }

}
let retro1: Pizzeria = MyRestaurent()

let retro2: MyRestaurent = MyRestaurent()
print(retro1.makeMargherita())
print(retro2.makeMargherita())




class ExampleClass {
    var value: Int = 0

    lazy var computedProperty: () -> Int = { [weak self] in
        return self?.value ?? 0
    }

    init(value: Int) {
        self.value = value
    }
}

var instance: ExampleClass? = ExampleClass(value: 42)
print(instance?.computedProperty() ?? 0) // Prints 42

instance = nil // The instance is deallocated here, so the weak reference becomes nil
print(instance?.computedProperty() ?? 0)

class Vehicle {
    let wheels: Int

    required init(wheels: Int) {
        self.wheels = wheels
    }
}

class Car: Vehicle {
    var brand: String

    init(brand: String) {
        self.brand = brand
        super.init(wheels: 4)
    }

    // Subclasses are required to provide an initializer that matches the signature of the required initializer in the base class.
    required init(wheels: Int) {
        self.brand = "Unknown"
        super.init(wheels: wheels)
    }
}

class Bicycle: Vehicle {
    init() {
        super.init(wheels: 2)
    }

    // Subclasses are required to provide an initializer that matches the signature of the required initializer in the base class.
    required init(wheels: Int) {
        super.init(wheels: wheels)
    }
}

let a = Bicycle()
print(a.wheels)



protocol NotificationHandler : AnyObject {
    func didReceiveNotification(data : Any, forKey: Any)
}

class CustomNotificationCentre {

    static var observers = [String : [NotificationHandler]]() // = [:]
    
    static func notify(forKey : String, data : String) {
        for obser in observers {
            if obser.key == forKey {
                for ob in obser.value {
                    ob.didReceiveNotification(data: data, forKey: forKey)
                }
            } else {
                print("not found")
            }
        }
//        if observers.contains(where: {$0.key == forKey}) {
//            for ob in observers[forKey]! {
//                ob.didReceiveNotification(data: data, forKey: forKey)
//            }
//        } else {
//            print("Dint find any such subscribed key")
//        }
    }
    
    static func addObserver(forKey : String, _ observer : NotificationHandler) {
        observers[forKey]?.append(observer)
    }
    
    static func removeObserver(forKey : String, _ observer : NotificationHandler) {
        observers.removeValue(forKey: forKey)
    }
    
}

class ObserverControllerOne : NotificationHandler {
    
    let keyMapper : String?
    
    init(_ keyMapper : String) {
        self.keyMapper = keyMapper
    }
    
    func didReceiveNotification(data: Any, forKey: Any) {
        let forKey = forKey as? String
        let data = data as? String
        print(data ?? " data not received")
        print("Received by Customer Notification Class 1")
    }
}

class ObserverControllerTwo : NotificationHandler {
    
    let keyMapper : String?
    
    init(_ keyMapper : String) {
        self.keyMapper = keyMapper
    }
    
    func didReceiveNotification(data: Any, forKey: Any) {
        let forKey = forKey as? String
        let data = data as? String
        print(data ?? " data not received")
        print("Received by Customer Notification Class 2")
    }
}

class SenderController  {
    
    func addObserverToNotificationHandler() {
        let ob1 = ObserverControllerOne("FirstViewController")
        let ob2 = ObserverControllerTwo("FirstViewController")
        CustomNotificationCentre.addObserver(forKey: "FirstViewController" ,ob1)
        CustomNotificationCentre.addObserver(forKey: "FirstViewController", ob2)
        CustomNotificationCentre.addObserver(forKey : "SecondViewController", ObserverControllerTwo("SecondViewController"))

    }
    
    func callNotifcationCentre() {
        CustomNotificationCentre.notify(forKey: "FirstViewController", data: "ram teri ganga maili hogyi")
        CustomNotificationCentre.notify(forKey: "SecondViewController", data: "laxman ki ganga maili hogyi")
    }
}


let s = SenderController()

s.addObserverToNotificationHandler()
s.callNotifcationCentre()

//DispatchQueue.main.asyncAfter(deadline: .now() + 3,execute : {
//    s.callNotifcationCentre()
//})

