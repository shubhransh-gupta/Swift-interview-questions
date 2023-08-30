//
//  Department+CoreDataProperties.swift
//  CoreDBExOne
//
//  Created by Shubhransh Gupta on 30/08/23.
//
//

import Foundation
import CoreData


extension Department {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Department> {
        return NSFetchRequest<Department>(entityName: "Department")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var deptname: String?
    @NSManaged public var toEmployees: NSSet?

}

// MARK: Generated accessors for toEmployees
extension Department {

    @objc(addToEmployeesObject:)
    @NSManaged public func addToToEmployees(_ value: Employee)

    @objc(removeToEmployeesObject:)
    @NSManaged public func removeFromToEmployees(_ value: Employee)

    @objc(addToEmployees:)
    @NSManaged public func addToToEmployees(_ values: NSSet)

    @objc(removeToEmployees:)
    @NSManaged public func removeFromToEmployees(_ values: NSSet)

}

extension Department : Identifiable {

}
