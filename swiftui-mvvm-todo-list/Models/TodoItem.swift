//
//  TodoItem.swift
//  swiftui-mvvm-todo-list
//
//  Created by Rick Brown on 11/06/2021.
//

import Foundation

struct TodoItem: Identifiable, Codable {
  let id: String
  let title: String
  let isCompleted: Bool
  
  init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
    self.id = id
    self.title = title
    self.isCompleted = isCompleted
  }
  
  func updateExistingTodoItem() -> TodoItem {
    TodoItem(id: id, title: title, isCompleted: !isCompleted)
  }
}
