//
//  ListViewModel.swift
//  swiftui-mvvm-todo-list
//
//  Created by Rick Brown on 11/06/2021.
//

import Foundation

class ListViewModel: ObservableObject {
  @Published var todoItems: Array<TodoItem> = []
  
  init() {
    getTodoItems()
  }
  
  func getTodoItems() -> Void {
    let newTodoItems = [
      TodoItem(title: "1st todo item", isCompleted: false),
      TodoItem(title: "2nd todo item", isCompleted: true),
      TodoItem(title: "3rd todo item", isCompleted: false)
    ]
    
    todoItems.append(contentsOf: newTodoItems)
  }
  
  /// CRUD OPERATIONS
  /// Create
  func addNewTodoItem(title: String) -> Void {
    let newTodoItem = TodoItem(title: title, isCompleted: false)
    
    todoItems.append(newTodoItem)
  }
  /// Remove
  func deleteTodoItem(indexSet: IndexSet) -> Void {
    todoItems.remove(atOffsets: indexSet)
  }
  /// Update
  func updateTodoItemCompletedStatus(todoItem: TodoItem) -> Void {
    if let index = todoItems.firstIndex(where: { $0.id == todoItem.id }) {
      todoItems[index] = todoItem.updateExistingTodoItem()
    }
  }
  /// Delete
  func moveTodoItem(from startOffset: IndexSet, to finishOffset: Int) -> Void {
    todoItems.move(fromOffsets: startOffset, toOffset: finishOffset)
  }
  
  
  
  
}

