//
//  CustomDispatchGroupTests.swift
//  CustomDispatchGroupTests
//
//  Created by Shubhransh Gupta on 16/01/25.
//

import XCTest
@testable import CustomDispatchGroup

final class CustomDispatchGroupTests: XCTestCase {
    
    func testDispatchGroupEnterLeave() {
        let customGroup = CustomDispatchGroup()
        let expectation = XCTestExpectation(description: "Tasks completed")
        
        var task1Completed = false
        var task2Completed = false
        
        customGroup.enter()
        DispatchQueue.global().async {
            sleep(1)
            task1Completed = true
            customGroup.leave()
        }
        
        customGroup.enter()
        DispatchQueue.global().async {
            sleep(2)
            task2Completed = true
            customGroup.leave()
        }
        
        customGroup.notify {
            XCTAssertTrue(task1Completed)
            XCTAssertTrue(task2Completed)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)  // Wait for 5 seconds max for the group to finish
    }
    
    func testDispatchGroupWait() {
        let customGroup = CustomDispatchGroup()
        
        let expectation = XCTestExpectation(description: "Tasks completed before wait finishes")
        
        customGroup.enter()
        DispatchQueue.global().async {
            sleep(1)
            customGroup.leave()
        }
        
        customGroup.enter()
        DispatchQueue.global().async {
            sleep(2)
            customGroup.leave()
        }
        
        DispatchQueue.global().async {
            customGroup.wait()  // This will block until all tasks finish
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testDispatchGroupWaitWithTimeoutSuccess() {
        let customGroup = CustomDispatchGroup()
        
        customGroup.enter()
        DispatchQueue.global().async {
            sleep(1)
            customGroup.leave()
        }
        
        customGroup.enter()
        DispatchQueue.global().async {
            sleep(2)
            customGroup.leave()
        }
        
        let waitSucceeded = customGroup.wait(timeout: .now() + 5)  // Expect tasks to finish in 5 seconds
        XCTAssertTrue(waitSucceeded, "Wait should succeed before timeout")
    }
    
    func testDispatchGroupWaitWithTimeoutFailure() {
        let customGroup = CustomDispatchGroup()
        
        customGroup.enter()
        DispatchQueue.global().async {
            sleep(3)
            customGroup.leave()
        }
        
        let waitSucceeded = customGroup.wait(timeout: .now() + 1)  // Set a 1-second timeout, expect failure
        XCTAssertFalse(waitSucceeded, "Wait should fail due to timeout")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
