//
//  Employee+CoreDataProperties.swift
//  heavyweightMigration
//
//  Created by Shubhransh Gupta on 09/09/23.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var address: String?
    @NSManaged public var dateOfJoining: String?
    @NSManaged public var panNo: String?

}

extension Employee : Identifiable {

}
