//
//  ListView.swift
//  swiftui-mvvm-todo-list
//
//  Created by Rick Brown on 11/06/2021.
//

import SwiftUI

struct ListView: View {
  @StateObject var listViewModel = ListViewModel()
  
  var body: some View {
      ZStack {
        if listViewModel.todoItems.isEmpty {
          NoTodoItemsView(listViewModel: listViewModel)
        } else {
          ForEach(listViewModel.todoItems) { todoItem in
            ListRowView(todoItem: todoItem)
              .onTapGesture {
                withAnimation(.linear) {
                  listViewModel.updateTodoItemCompletedStatus(todoItem: todoItem)
                }
              }
          }
          .onDelete(perform: listViewModel.deleteTodoItem)
          .onMove(perform: listViewModel.moveTodoItem)
        }
      }
      .listStyle(PlainListStyle())
      .navigationBarTitle("📝 TodoList")
      .navigationBarItems(
        leading: EditButton(),
        trailing: NavigationLink("Add", destination: AddView(listViewModel: listViewModel)))
  }
}

struct ListView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      ListView()
    }
  }
}
