//
//  TodoListViewModel.swift
//  TodoList
//
//  Created by Thongchai Subsaidee on 29/8/2564 BE.
//

import SwiftUI
import CoreData

class TodoListViewModel: ObservableObject {
    
    func addTask() {
        let task = Task(context: CoreDataManger.shared.viewContext)
        task.title = "New task: \(Date())"
        task.date = Date()
        task.save()
    }
    
    func deleteTask(task: Task) {
        let coreDM = CoreDataManger.shared
        coreDM.viewContext.delete(task)
        do{
            try coreDM.viewContext.save()
        }catch{
            coreDM.viewContext.rollback()
        }
    }
    
    func updateTask(task: FetchedResults<Task>.Element) {
        task.title = "Update task: \(Date())"
        task.date = Date()
        task.save()
    }
}

