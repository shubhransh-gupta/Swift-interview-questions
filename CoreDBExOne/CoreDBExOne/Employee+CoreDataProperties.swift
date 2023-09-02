//
//  Employee+CoreDataProperties.swift
//  CoreDBExOne
//
//  Created by Shubhransh Gupta on 30/08/23.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var address: String?
    @NSManaged public var name: String?
    @NSManaged public var toDepartment: Department?

}

extension Employee : Identifiable {

}
