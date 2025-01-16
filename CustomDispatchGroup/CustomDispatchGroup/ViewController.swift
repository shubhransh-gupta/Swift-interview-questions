//
//  ViewController.swift
//  CustomDispatchGroup
//
//  Created by Shubhransh Gupta on 16/01/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let customGroup = CustomDispatchGroup()

        customGroup.enter()
        DispatchQueue.global().async {
            print("Task 1 started")
            sleep(2)
            print("Task 1 completed")
            customGroup.leave()
        }

        customGroup.enter()
        DispatchQueue.global().async {
            print("Task 2 started")
            sleep(1)
            print("Task 2 completed")
            customGroup.leave()
        }

        customGroup.notify {
            print("All tasks completed!")
        }
        customGroup.wait()  // Blocks until all tasks are complete
        print("Wait finished")

        // Example of wait with timeout
        if customGroup.wait(timeout: .now() + 3) {
            print("Tasks completed before timeout")
        } else {
            print("Timeout reached before all tasks completed")
        }
    }


}

class CustomDispatchGroup {
    private let semaphore = DispatchSemaphore(value: 1)
    private var taskCount = 0
    private let waitSemaphore = DispatchSemaphore(value: 0)
    private var completionHandler: (() -> Void)?
    
    func enter() {
        semaphore.wait()
        defer { semaphore.signal() }
        taskCount += 1
    }
    
    func leave() {
        semaphore.wait()
        defer { semaphore.signal() }
        taskCount -= 1
        if taskCount == 0 {
            waitSemaphore.signal()
            completionHandler?()
        }
    }
    
    func notify(_ completion: @escaping () -> Void) {
        semaphore.wait()
        defer { semaphore.signal() }
        completionHandler = completion
       
        if taskCount == 0 {
            waitSemaphore.signal()
            completionHandler?()
        }
    }
    
    func wait() {
        waitSemaphore.wait()
    }
    
    func wait(timeout: DispatchTime) -> Bool {
        return waitSemaphore.wait(timeout: timeout) == .success
    }
}

