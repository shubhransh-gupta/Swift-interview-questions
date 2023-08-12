import UIKit

class Sender {
    var closure : ((Any) -> ())?
    func sendDataToListener(data : Any) {
        if let closure = closure {
            let array = ["\(String(describing: data))"]
            closure(array)
        }
    }
}

let send = Sender()

class ReceiverOne {
    
    func didRecieveData() {
        send.closure = { (res) in
            if let res = res as? String {
                print(res)
                print("1st")
            }
        }
    }
}
//let r1 = ReceiverOne()
//r1.didRecieveData()
class ReceiverTwo {
    
    func didRecieveData() {
        send.closure = { (res) in
            print(res)
            print("2nd")
        }
    }
}


let r2 = ReceiverTwo()

r2.didRecieveData()
send.sendDataToListener(data: "2.000")

send.sendDataToListener(data: "Shubh")

send.sendDataToListener(data: "12.00")

