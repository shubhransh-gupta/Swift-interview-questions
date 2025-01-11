//
//  PerformanceTableMethodStaticDispatchTests.swift
//  PerformanceTableMethodStaticDispatchTests
//
//  Created by Shubhransh Gupta on 11/01/25.
//

import XCTest
@testable import PerformanceTableMethodStaticDispatch

final class PerformanceTableMethodStaticDispatchTests: XCTestCase {

    var dis: Dispatch?
    var a: A?
    var d: D?
    var b: B?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        a = A()
        d = D()
        b = B()
        dis = Dispatch()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            //self.a?.testA()
            //self.dis?.performB(ob: b!)
            self.dis?.performD(ob: d!)
            // Put the code you want to measure the time of here.
        }
    }

}
