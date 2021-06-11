//
//  ListView.swift
//  swiftui-mvvm-todo-list
//
//  Created by Rick Brown on 11/06/2021.
//

import SwiftUI

struct ListView: View {
  @State private var items: Array<TodoItem> = [
    TodoItem(title: "1st todo item", isCompleted: false),
    TodoItem(title: "2nd todo item", isCompleted: true),
    TodoItem(title: "3rd todo item", isCompleted: false)
  ]
  
  var body: some View {
      List(items) { todoItem in
        ListRowView(todoItem: todoItem)
      }
      .listStyle(PlainListStyle())
      .navigationBarTitle("✏️ TodoList")
      .navigationBarItems(
        leading: EditButton(),
        trailing: NavigationLink("Add", destination: AddView()))
  }
}

struct ListView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      ListView()
    }
  }
}
