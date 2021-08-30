//
//  ContentView.swift
//  TodoList
//
//  Created by Thongchai Subsaidee on 29/8/2564 BE.
//

import SwiftUI

struct ContentView: View {
    
//    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(fetchRequest: Task.all())
    var tasks: FetchedResults<Task>
    
    @StateObject private var todoListVM = TodoListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(tasks) { task in
                    
                    NavigationLink(
                        destination: NoteView(task: task),
                        label: {
                            Text(task.title ?? "Untitled")
                                .onTapGesture {
                                    withAnimation {
                                        todoListVM.updateTask(task: task)
                                    }
                                }
                        })
                }
                .onDelete(perform: { indexSet in
                    withAnimation {
                        indexSet.map({tasks[$0]}).forEach { task in
                            todoListVM.deleteTask(task: task)
                        }
                    }
                })
            }
            .navigationBarTitle(Text("Todo List"))
            .navigationBarItems(trailing: Button("Add Task"){
                withAnimation {
                    todoListVM.addTask()
                }
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
