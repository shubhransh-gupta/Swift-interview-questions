//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

//let serialThread = DispatchQueue(label: "Serial Thread")
//let concurrent = DispatchQueue(label: "Serial Thread1",attributes: [.concurrent])
//
//
//func perform() {
//    print("1")
//    serialThread.sync {
//        print("2")
//       concurrent.async {
//            for i in 1...30{
//                print("------------->\(i)")
//            }
//        }
//        print("4")
//    }
//    print("5")
//}
//perform()
//
//
//DispatchQueue.main.async {
//    print(1)
//    DispatchQueue.main.sync {
//        print(2)
//    }
//}
//class A {
//    var i = 0
//    var closureArray = ()->()
//    init() {
//
//    }
//
//    func ab() {
//        for _ in 1..<6 {
//            closureArray.append {
//                print(self.i)
//            }
//            i += 1
//        }
//    }
//
//    deinit {
//        print("deinit A")
//    }
//}
//
//class B {
//    var closureArray2 = [()->()]()
//    var j = 0
//    init() {
//
//    }
//    func ab() {
//        for _ in 1..<6 {
//            closureArray2.append { [j] in
//                print(j)
//            }
//            j += 1
//        }
//    }
//
//    deinit {
//        print("deinit B")
//    }
//}
//
//func c() {
//    let a = A()
//    a.ab()
//    let b = B()
//    b.ab()
//}
//c()

//let q1 = DispatchQueue(label: "abc")
//let q2 = DispatchQueue(label: "abc")
//let q3 = DispatchQueue(label: "abc")

class SharedInstanceClass {
    lazy var testVar = {
        return Int.random(in: 0..<99)
    }()
}

let queue = DispatchQueue(label: "test", qos: .default, attributes: [.initiallyInactive, .concurrent], autoreleaseFrequency: .workItem, target: nil)
let group = DispatchGroup()


let instance = SharedInstanceClass()
for i in 0 ..< 10 {
    group.enter()
    queue.async(group: group, qos: .default) {
        let id = i
        print("\(id) \(instance.testVar)")
        group.leave()
    }
}
queue.activate()
group.wait()
