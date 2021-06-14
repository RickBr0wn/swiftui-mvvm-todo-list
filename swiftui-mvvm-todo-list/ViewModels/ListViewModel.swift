//
//  ListViewModel.swift
//  swiftui-mvvm-todo-list
//
//  Created by Rick Brown on 11/06/2021.
//

import Foundation

class ListViewModel: ObservableObject {
  @Published var todoItems: Array<TodoItem> = [] {
    /// Everytime the array is mutated, save the new array into `UserDefaults`
    didSet {
      saveCurrentTodoItems()
    }
  }
  
  /// A `String`, scoped to the `ViewModel`, to use as a `forKey`identifier with `UserDefaults`
  let itemsKey: String = "todo_items_list"
  
  /// Initialize the `todoItems` array
  init() {
    getCurrentTodoItems()
  }
  
  /// CRUD OPERATIONS
  /// Create
  func addNewTodoItem(title: String) -> Void {
    let newTodoItem = TodoItem(title: title, isCompleted: false)
    
    todoItems.append(newTodoItem)
  }
  /// Remove
  /// The `perform` parameter in the `ListView` `ForEach.onDelete {}` modifier will supply the `IndexSet`
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
  /// The `perform` parameter in the `ListView` `ForEach.onMove {}` modifier will supply the `IndexSet`
  func moveTodoItem(from startOffset: IndexSet, to finishOffset: Int) -> Void {
    todoItems.move(fromOffsets: startOffset, toOffset: finishOffset)
  }
  
  /// Persistance Layer: `UserDefaults` - requires using the `Codable` protocol on the `TodoItem` model.
  func saveCurrentTodoItems() -> Void {
    /// `Codable` will convert the `todoItems` array into `JSON` format, the `JSON` in a `Data` type.
    /// The coded `Data` type can then be passed to `UserDefaults.standard.set(: Any?, forKey: String)`,
    /// The `forKey` parameter is a `constant`variable. defined in the parent scope, as a `String`.
    /// This `String` is then used to identify the data stored in `UserDefaults`.
    if let encodedData = try? JSONEncoder().encode(todoItems) {
      UserDefaults.standard.set(encodedData, forKey: itemsKey)
    }
  }
  
  func getCurrentTodoItems() -> Void {
    /// `Codable` will convert the 'todoItems JSON Blob' (`Data` type) back into `JSON` format
    guard
      let data = UserDefaults.standard.data(forKey: itemsKey),
      let existingTodoItems = try? JSONDecoder().decode(Array<TodoItem>.self, from: data)
      else { return }
    
    self.todoItems = existingTodoItems
  }
  
}

