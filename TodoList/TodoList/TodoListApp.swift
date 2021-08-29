//
//  TodoListApp.swift
//  TodoList
//
//  Created by Thongchai Subsaidee on 29/8/2564 BE.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    let coreDM = CoreDataManger.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, coreDM.viewContext)
        }
    }
}
