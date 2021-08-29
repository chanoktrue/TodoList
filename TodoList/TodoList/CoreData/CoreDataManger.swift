//
//  CoreDataManger.swift
//  TodoList
//
//  Created by Thongchai Subsaidee on 29/8/2564 BE.
//

import Foundation
import CoreData

class CoreDataManger {
    
    static let shared = CoreDataManger()
    
    var persistentContrainer: NSPersistentContainer
    var viewContext: NSManagedObjectContext {
        persistentContrainer.viewContext
    }
    
    init() {
        persistentContrainer = NSPersistentContainer(name: "TodoList")
        persistentContrainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to init core data with error: \(error)")
            }
        }
    }
    
}
