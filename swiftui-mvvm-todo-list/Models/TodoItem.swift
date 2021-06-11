//
//  TodoItem.swift
//  swiftui-mvvm-todo-list
//
//  Created by Rick Brown on 11/06/2021.
//

import Foundation

struct TodoItem: Identifiable {
  let id: String = UUID().uuidString
  let title: String
  var isCompleted: Bool
}
