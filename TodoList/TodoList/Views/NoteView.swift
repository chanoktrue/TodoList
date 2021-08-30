//
//  NoteView.swift
//  TodoList
//
//  Created by Thongchai Subsaidee on 30/8/2564 BE.
//

import SwiftUI

struct NoteView: View {
    
    let task: Task
    var request: FetchRequest<Note>
    
    init(task: Task) {
        self.task = task
        self.request = FetchRequest<Note>(
            entity: Note.entity(),
            sortDescriptors: [],
            predicate: NSPredicate(format: "%K = %@", #keyPath(Note.task), task.objectID ))
    }
    
    var notes: FetchedResults<Note> {
        return request.wrappedValue
    }
    
    @StateObject private var noteVM = NoteViewModel()
    
    var body: some View {
        VStack {
            TextEditor(text: $noteVM.title)
                .frame(height: 100)
                .background(Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)))
            
            HStack{
                Spacer()
                Button("Save") {
                    noteVM.save(task: task)
                }
                Spacer()
            }
            
            List(notes, id: \.self) { note in
                Text(note.note ?? "")
            }
            
            Spacer()
        }
        
            .navigationBarTitle(Text(task.title ?? ""))
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView(task: Task(context: CoreDataManger.shared.viewContext))
    }
}
