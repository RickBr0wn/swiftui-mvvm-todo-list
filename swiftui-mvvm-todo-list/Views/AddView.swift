//
//  AddView.swift
//  swiftui-mvvm-todo-list
//
//  Created by Rick Brown on 11/06/2021.
//

import SwiftUI

struct AddView: View {
  @State private var newTodoItem: String = ""
  
  var body: some View {
    ScrollView {
      VStack {
        TextField("Add new todo item..", text: $newTodoItem)
          .padding(.horizontal)
          .frame(height: 55)
          .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
          .cornerRadius(10.0)

        Button(action: {
          
        }, label: {
          Text("Save".uppercased())
            .foregroundColor(.white)
            .font(.headline)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(10.0)
        })
      }
      .padding(14)
    }
    .navigationBarTitle("Add an item ✏️")
  }
}

struct AddView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      AddView()
    }
  }
}
