//
//  ViewController.swift
//  PerformanceTableMethodStaticDispatch
//
//  Created by Shubhransh Gupta on 11/01/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

struct A {
    var num = 1
    mutating func testA() {
        print("print A performance")
        num += 1
    }
}

final class B {
    var num = 1
    func testB() {
        print("print B performance")
        num += 1
    }
}

class C {
    
    func testC() {
        print("print A performance")
    }
}

class D : C{
    var num = 1
    override func testC() {
        print("print A performance")
        num += 1
    }
}

class Dispatch {
    
    func performB(ob: B) {
        for _ in  0..<100 {
            ob.testB()
        }
    }
    
    func performD(ob: D) {
        for _ in  0..<100 {
            ob.testC()
        }
    }
}
