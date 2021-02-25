//
//  ContentView.swift
//  ToDoApp
//
//  Created by Macboook on 15/02/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    @State var newToDo : String = ""
    
    var searchBar : some View {
        HStack {
            TextField("Enter in a new task", text: self.$newToDo)

            Button(action: self.addNewToDo, label: {
                Text("Tambah Tugas")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.green/*@END_MENU_TOKEN@*/)
            })
        }
        
    }
    
    func addNewToDo() {
        taskStore.tasks.append(Task(id: String(taskStore.tasks.count + 1), toDoItem: newToDo))
        self.newToDo = ""
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                searchBar.padding()
                List {
                    ForEach(self.taskStore.tasks) { task in
                        Text(task.toDoItem)
                            .foregroundColor(.black)
                            .bold()
                    }.onMove(perform: self.move)
                    .onDelete(perform: self.delete)
                    
                }.navigationBarTitle("Tugas")
                
                .navigationBarItems(trailing: EditButton()
                                        .foregroundColor(/*@START_MENU_TOKEN@*/.green/*@END_MENU_TOKEN@*/))
           
            }
        }
    }
    
    
    func move(from source : IndexSet, to destination : Int) {
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets : IndexSet) {
        taskStore.tasks.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
            ContentView()
        }
            
    }
}
