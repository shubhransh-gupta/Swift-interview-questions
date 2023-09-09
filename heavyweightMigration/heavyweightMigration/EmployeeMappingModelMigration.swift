//
//  EmployeeMappingModelMigration.swift
//  heavyweightMigration
//
//  Created by Shubhransh Gupta on 09/09/23.
//

import Foundation
import UIKit
import CoreData

class EmployeeMappingModelMigration : NSEntityMigrationPolicy {
    override func createDestinationInstances(forSource sInstance: NSManagedObject, in mapping: NSEntityMapping, manager: NSMigrationManager) throws {
        if sInstance.entity.name == Employee.description() {
            let name = sInstance.value(forKey: "name")
            let panNo = sInstance.value(forKey: "panNo")
            let address = sInstance.value(forKey: "address")
            let id = sInstance.value(forKey: "id")
            let dateOfJoining = sInstance.value(forKey: "dateOfJoining")
            
            let destinationContextObject = NSEntityDescription.insertNewObject(forEntityName: Employee.description(), into: manager.destinationContext)
            
            destinationContextObject.setValue(name, forKey: "name")
            destinationContextObject.setValue(Int(panNo as! String), forKey: "aadharNo")

            destinationContextObject.setValue(address, forKey: "address")
            destinationContextObject.setValue(Int(id as! String), forKey: "id")
            let fromatter = DateFormatter()
            fromatter.dateFormat = "yyyy-MM-dd"
            let doj = fromatter.date(from: dateOfJoining as! String)
            destinationContextObject.setValue(doj, forKey: "dateOfJoining")

        }
    }
}
