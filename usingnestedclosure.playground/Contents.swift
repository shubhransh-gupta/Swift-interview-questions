import UIKit

var greeting = "Hello, playground"
class A {
    typealias CompletedBlock = (Bool) -> ()
    
    func loginAsync() {
        doSomeAsync1 { [weak self] (result) in
            if result {
                self?.doSomeAsync2 { success in
                    if result {
                        self?.doSomeAsync3(complete: { isSend in
                            if isSend {
                                print("login success")
                                return
                            }
                        })
                        return
                    }
                    print("login error")
                }
                return
            }
            print("login error")
        }
    }
    
    func doSomeAsync1(complete: @escaping CompletedBlock) {
        DispatchQueue.global().async {
            complete(true)
        }
    }
    
    func doSomeAsync2(complete: @escaping CompletedBlock) {
        DispatchQueue.global().async {
            complete(true)
        }
    }
    
    func doSomeAsync3(complete: @escaping CompletedBlock) {
        DispatchQueue.global().async {
            complete(true)
        }
    }
}
A().loginAsync()
