//
//  ActivityController.swift
//  Rocco_Bored
//
//  Created by Rocco Alexander on 2021-04-20.
//  033315151

import Foundation
import CoreData
import UIKit

class ActivityController{
    private static var shared : ActivityController?
    
    static func getInstance() -> ActivityController{
        if shared != nil{
            return shared!
        }else{
            return ActivityController(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
        }
    }
    
//    Set up Entity Name and Context
    private let moc : NSManagedObjectContext
    private let ENTITY = "Activities"
    private init(context: NSManagedObjectContext){
        self.moc = context
    }
    
//    Data Insertion
    func insertActivity(new: ActivityModel){
        do{
            let newActivity = NSEntityDescription.insertNewObject(forEntityName: ENTITY, into: self.moc) as! Activities
            
//            Set up the object for storage
            newActivity.id = UUID()
            newActivity.name = new.name
            
            if self.moc.hasChanges{
                try self.moc.save()
                print("Saved Activity")
            }
            }catch let error as NSError{
                print("Error saving Activity: \(error)")
        }
    }
    
//    Find Data by ID
    func findActivityByID(id:UUID) -> Activities?{
        let fetchRequest = NSFetchRequest<Activities>(entityName: ENTITY)
        let predicateID = NSPredicate(format: "id == %@", id as CVarArg)
        fetchRequest.predicate = predicateID
        do{
            let result = try self.moc.fetch(fetchRequest)
            if(result.count > 0){
                return result.first as? Activities
            }
        }catch let error as NSError{
            print("Error occured finding activities: \(error)")
        }
        return nil
    }
    
//    Delete Data by ID
    func deleteActivityByID(id:UUID){
        let result = self.findActivityByID(id: id)
        if(result != nil){
            do{
                try self.moc.delete(result!)
                try self.moc.save()
                print("Activity Deleted")
            }catch let error as NSError{
                print("Error Deleting Activty: \(error)")
            }
        }
    }
    
//    Returns all Data
    func getAllActivities() ->[Activities]?{
        let fetchRequest = NSFetchRequest<Activities>(entityName: ENTITY)
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "id", ascending: false)]
        do{
            let result = try self.moc.fetch(fetchRequest)
            print(#function, "Fetched Data: \(result as [Activities])")
            return result as [Activities]
        }catch let error as NSError{
            print("Error Fetching Activities: \(error)")
        }
        return nil
    }
}
