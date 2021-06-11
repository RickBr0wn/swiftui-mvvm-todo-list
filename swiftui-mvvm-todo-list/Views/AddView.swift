//
//  AddView.swift
//  swiftui-mvvm-todo-list
//
//  Created by Rick Brown on 11/06/2021.
//

import SwiftUI

struct AddView: View {
  @Environment(\.presentationMode) var presentationMode
  @StateObject var listViewModel: ListViewModel
  @State private var newTodoItem: String = ""
  @State var alertTitle: String = ""
  @State var showAlert: Bool = false
  
  var body: some View {
    ScrollView {
      VStack {
        TextField("Add new todo item..", text: $newTodoItem)
          .padding(.horizontal)
          .frame(height: 55)
          .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
          .cornerRadius(10.0)
        
        Button(action: saveButtonPressed, label: {
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
    .alert(isPresented: $showAlert, content: getAlert)
  }
  
  func saveButtonPressed() -> Void {
    if textIsAppropiate() {
      listViewModel.addNewTodoItem(title: newTodoItem)
      presentationMode.wrappedValue.dismiss()
    }
  }
  
  func textIsAppropiate() -> Bool {
    newTodoItem.count < 3 ? handleInappropiateText() : true
  }
  
  func getAlert() -> Alert {
    Alert(title: Text(alertTitle))
  }
  
  func handleInappropiateText() -> Bool {
    alertTitle = "Please be more descriptive with your Todo Items, it will be really difficult in the future, to remember what they mean without more context."
    showAlert.toggle()
    return false
  }
}

struct AddView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      AddView(listViewModel: ListViewModel())
    }
  }
}
