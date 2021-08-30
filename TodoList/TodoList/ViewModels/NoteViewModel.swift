//
//  NoteViewModel.swift
//  TodoList
//
//  Created by Thongchai Subsaidee on 30/8/2564 BE.
//

import SwiftUI

class NoteViewModel: ObservableObject {
    
    @Published var title: String = ""
    
    func save(task: Task) {
        let note = Note(context: CoreDataManger.shared.viewContext)
        note.note = title
        task.addToNotes(note)
        task.save()
        
        title = ""
    }
    
}
