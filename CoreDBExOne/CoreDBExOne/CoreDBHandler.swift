//
//  CoreDBHandler.swift
//  CoreDBExOne
//
//  Created by Shubhransh Gupta on 15/08/23.
//

import Foundation
import CoreData

class CoreDBHandler {
    static let shared = CoreDBHandler()
    
    lazy var context = persistentContainer.viewContext
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "CoreDBExOne")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
       
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetchEmployee() -> [Employee]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Employee")
        do {
            let res = try context.fetch(fetchRequest)
            return res as? [Employee]
        } catch let err as NSError {
            print("some error caught" + "\(err)" + "\(err.userInfo)")
        }
        
      return nil
    }
    
    func setEmployee(nameA : [String], homeA : [String]) {
        if let url = persistentContainer.persistentStoreCoordinator.persistentStores.first?.url {
            print("SQLite File URL: \(url)")
        }
        let entity = NSEntityDescription.entity(forEntityName: "Employee", in: context)!
        
        for i in 0..<Int(nameA.count) {
            let managedOb = NSManagedObject(entity: entity, insertInto: context)
            managedOb.setValue(nameA[i], forKey: "name")
            managedOb.setValue(homeA[i], forKey: "address")
        }
        
        do {
            try context.save()
        } catch let err as NSError {
            print("some error caught" + "\(err)" + "\(err.userInfo)")
        }
    }
    
    func updateData(nameToSet : String, nameToUpdate : String) {
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: Employee.description())
        fetchReq.predicate = NSPredicate(format: "name = %@", nameToUpdate)
        
        do {
            let manageObj = try context.fetch(fetchReq)
            for updObj in manageObj {
                let updObj1 = updObj as! NSManagedObject
                updObj1.setValue(nameToSet, forKey: "name")
                updObj1.setValue(nameToSet, forKey: "address")
            }
            do {
                try context.save()
            } catch {
                
            }
            
        } catch let err as NSError {
            print("some error caught" + "\(err)" + "\(err.userInfo)")
        }
    }
    
    func updateDataOfDept(nameToSet : String, nameToUpdate : String) {
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: Department.description())
        fetchReq.predicate = NSPredicate(format: "name = %@", nameToUpdate)
        
        do {
            let manageObj = try context.fetch(fetchReq)
            for updObj in manageObj {
                let updObj1 = updObj as! NSManagedObject
                updObj1.setValue(nameToSet, forKey: "deptname")
                updObj1.setValue(nameToSet, forKey: "id")
            }
            do {
                try context.save()
            } catch {
                
            }
            
        } catch let err as NSError {
            print("some error caught" + "\(err)" + "\(err.userInfo)")
        }
    }
    
    func setDepartment(nameA : [String], id : [UUID]) {
        let entity = NSEntityDescription.entity(forEntityName: Department.description(), in: context)!
        
        for i in 0..<Int(nameA.count) {
            let managedOb = NSManagedObject(entity: entity, insertInto: context)
            managedOb.setValue(nameA[i], forKey: "deptname")
            managedOb.setValue(id[i], forKey: "id")
        }
        
        do {
            try context.save()
        } catch let err as NSError {
            print("some error caught" + "\(err)" + "\(err.userInfo)")
        }
    }
    
    func deleteData(employeeToDelete : String) {
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: Employee.description())
        fetchReq.predicate = NSPredicate(format: "name = %@", employeeToDelete)
        
        do {
            let manageOb = try context.fetch(fetchReq)
            for delObj in manageOb {
                let delObj1 = delObj as! NSManagedObject
                context.delete(delObj1)
            }
            
            do {
                try context.save()
            } catch {
                
            }
        } catch let err as NSError {
            print("some error caught" + "\(err)" + "\(err.userInfo)")
        }
    }
}
