//
//  AddItemView.swift
//  To do list
//
//  Created by Student on 1/11/22.
//

import SwiftUI

struct AddItemView: View {
    
    @Environment(\.presentationMode) var presentationMode
        static let priorities = ["High", "Medium", "Low"]
    
        @ObservedObject var toDoList: ToDoList
        @State private var showingAddItemView = false
        @State private var priority = ""
        @State private var description = ""
        @State private var dueDate = Date()
    
        
    var body: some View {
        NavigationView {
           Form {
            TextField("Description", text: $description)
            DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                Picker("Priority", selection: $priority) {
                    ForEach(Self.priorities, id: \.self) { priority in
                        Text(priority)
                    }
                }
            }
           .sheet(isPresented: $showingAddItemView, content: {
                AddItemView(toDoList: toDoList)
            })
           .navigationBarTitle("Add New To-Do Item", displayMode: .inline)
           .navigationBarItems(leading: EditButton(),
                              trailing: Button(action: {
                                  showingAddItemView = true}) {
                                  Image(systemName: "plus")
            })
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(toDoList: ToDoList())
    }
}

    
