import UIKit

protocol NotificationHandler : AnyObject {
    func didReceiveNotification(data : Any, forKey: Any)
}

class CustomNotificationCentre {
    
    
    static var observers = [String : [NotificationHandler]]() // = [:]
    
    static func notify(forKey : String, data : String) {
        for (aKey, aValue) in observers {
            print(1)
            if aKey == forKey {
                for ob in aValue {
                    ob.didReceiveNotification(data: data, forKey: forKey)
                }
            }
        }
    }
    
    static func addObserver(forKey : String, _ observer : NotificationHandler) {
        if observers[forKey] != nil {
            observers[forKey]?.append(observer)
        } else {
            observers[forKey] = [observer]
        }
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
