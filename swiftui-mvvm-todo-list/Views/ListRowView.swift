//
//  ListRowView.swift
//  swiftui-mvvm-todo-list
//
//  Created by Rick Brown on 11/06/2021.
//

import SwiftUI

struct ListRowView: View {
  var todoItem: TodoItem
  
  var body: some View {
    HStack {
      Image(systemName: todoItem.isCompleted ? "checkmark.circle" : "circle")
        .foregroundColor(todoItem.isCompleted ? Color.green : Color.red)
        .font(.title2)
        .padding(.vertical, 8)
        .padding(.horizontal)
      
      Text(todoItem.title)
      
      Spacer()
      
      
    }
  }
}

struct ListRowView_Previews: PreviewProvider {
  static var todoItem = TodoItem(title: "1st", isCompleted: true)
  static var todoItem2 = TodoItem(title: "2nd", isCompleted: false)
  
  static var previews: some View {
    Group {
      ListRowView(todoItem: todoItem)
      
      ListRowView(todoItem: todoItem2)
    }
    .previewLayout(.sizeThatFits)
  }
}

