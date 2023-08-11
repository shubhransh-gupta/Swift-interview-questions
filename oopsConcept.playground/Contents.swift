import UIKit

func printx(_ a : Int) {
    for i in 1...20*a {
        print("\(a)" + " - \(i)")
    }
}

func perform() {
    let q1 = DispatchQueue(label: "q1", attributes: .concurrent)
    let q2 = DispatchQueue(label: "q2")
    let q3 = DispatchQueue(label: "q3")
    
    q3.async {
        printx(1)
        q2.sync {
            printx(2)
            q3.async {
                printx(6)
            }
        }
        q3.async {
            printx(3)
        }
        q2.sync {
            printx(4)
        }
        q3.async {
            printx(5)
        }
    }
}
perform()
