
import Foundation
let q1 = DispatchQueue(label: "q1", attributes: .concurrent)
let q2 = DispatchQueue.global(qos: .background)

func asyncFuncOne() async -> Int {
    Thread.sleep(forTimeInterval: 5)
    return 1
}

func asyncFuncTwo(_ a : Int) async {
    Thread.sleep(forTimeInterval: 10)
}

Task {
    print(111)
        let a = await asyncFuncOne()
        _ = await asyncFuncTwo(a)
        print(a)
        print(123)
}
