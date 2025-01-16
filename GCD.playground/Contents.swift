import UIKit

var greeting = "Hello, playground"


func print(x: Int) {
    for i in 0..<10 {
        print(x)
    }
}

//DispatchQueue.main.async {
//    print(x: 1)
//    DispatchQueue.main.async {
//        print(x: 2)
//        DispatchQueue.main.async {
//            print(x: 3)
//            DispatchQueue.main.async {
//                print(x: 4)
//            }
//            print(x: 5)
//        }
//        print(x: 6)
//    }
//    print(x: 7)
//}
//1->7->2->6->3->5-->4


let q1 = DispatchQueue.global(qos: .userInitiated)
let q2 = DispatchQueue(label: "abc", qos: .userInitiated, attributes: .concurrent)

//q1.async {
//    print(x: 1)
//    
//    q2.async {
//        print(x: 2)
//        q2.sync {
//            print(x: 3)
//            q1.sync {
//                print(x: 4)
//            }
//            print(x: 5)
//        }
//        print(x: 6)
//    }
//    
//    print(x: 7)
//    
//}
//print(x: 8)


//1<->8->7->2->3->4->5->6


let q3 = DispatchQueue(label: "ramram")

//q1.async {
//    print(x: 1)
//    
//    q3.sync {
//        print(x: 2)
//        q3.sync { //crashed here
//            print(x: 3)
//            q1.sync {
//                print(x: 4)
//            }
//            print(x: 5)
//        }
//        print(x: 6)
//    }
//    
//    print(x: 7)
//    
//}
//print(x: 8)

//q1.async {
//    print(x: 1)
//    
//    q3.sync {
//        print(x: 2)
//        q2.sync {
//            print(x: 3)
//            q1.sync {
//                print(x: 4)
//            }
//            print(x: 5)
//        }
//        print(x: 6)
//    }
//    
//    print(x: 7)
//    
//}
//print(x: 8)

//q1.async {
//    print(x: 1)
//    
//    q3.sync {
//        print(x: 2)
//        q3.async {
//            print(x: 3)
//            q1.sync {
//                print(x: 4)
//            }
//            print(x: 5)
//        }
//        print(x: 6)
//    }
//    
//    print(x: 7)
//    
//}
//print(x: 8)

//1<->8->2->6->3->4<->7->5


//q1.async {
//    print(x: 1)
//    
//    q2.async {
//        print(x: 2)
//        q2.sync {  //crashed in case of single queue
//            print(x: 3)
//            q1.async {
//                print(x: 4)
//            }
//            print(x: 5)
//        }
//        print(x: 6)
//    }
//    
//    print(x: 7)
//    
//}
//print(x: 8)
//output incase q3 is a concurrent queue
//1<->8->7->2->3->4->5->6
