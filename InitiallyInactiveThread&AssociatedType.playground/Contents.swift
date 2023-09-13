import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true


//let serialThread = DispatchQueue(label: "Serial Thread")
//let serialThread2 = DispatchQueue(label: "Serial Thread1",attributes: [.concurrent , .initiallyInactive])
//serialThread2.setTarget(queue: serialThread)
//serialThread2.activate()
//func perform() {
//    print("1")
//    serialThread.sync {
//        print("2")
//        serialThread2.async(flags: .barrier, execute: {
//            for i in 1...30{
//                print("------------->\(i)")
//            }
//        })
//        print("4")
//    }
//    print("5")
//}
//
//perform()

protocol CRUDOperations {
    associatedtype Item
    func addItem(x : Item) -> Item
}

class Sstring : CRUDOperations {
    var a : String = "H"
    typealias Item = String
    
    func addItem(x : Item) -> Item {
        return a + x
    }
}

class SAdd : CRUDOperations {
    var a : Int = 0
    func addItem(x: Int) -> Int {
        return a + x
    }
    
    typealias Item = Int
    
    
}

let s = Sstring()
print(s.addItem(x: "hekoo"))

let a = SAdd()
print(a.addItem(x: 1))
