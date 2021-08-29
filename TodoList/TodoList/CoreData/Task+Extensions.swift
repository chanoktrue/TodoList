//
//  Task+Extensions.swift
//  TodoList
//
//  Created by Thongchai Subsaidee on 29/8/2564 BE.
//

import Foundation
import CoreData

extension Task {
    
    func save() {
        do{
            try CoreDataManger.shared.viewContext.save()
        }catch{
            CoreDataManger.shared.viewContext.rollback()
        }
    }
    
    static func all() -> NSFetchRequest<Task> {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
        return request
    }
    
}
