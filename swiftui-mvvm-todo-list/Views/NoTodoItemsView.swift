//
//  NoTodoItemsView.swift
//  swiftui-mvvm-todo-list
//
//  Created by Rick Brown on 11/06/2021.
//

import SwiftUI

struct NoTodoItemsView: View {
  @StateObject var listViewModel: ListViewModel
  @State var animate: Bool = false
  
  let primaryAccentColor = Color("AccentColor")
  let secondaryAccentColor = Color("SecondaryAccentColor")
  
  var body: some View {
    ScrollView {
      VStack(spacing: 10) {
        Text("You have no to-do items in your list.")
          .font(.title)
          .fontWeight(.bold)
        
        Text("Are you really this productive? \nSurely not..\nClick the add button and start adding to your list..")
          .font(.headline)
          .fontWeight(.semibold)
        
        Spacer()
        
        NavigationLink(
          destination: AddView(listViewModel: listViewModel),
          label: {
            Text("Add 🥳".uppercased())
              .foregroundColor(.white)
              .font(.headline)
              .frame(height: 55)
              .frame(maxWidth: .infinity)
              .background(animate ? primaryAccentColor : secondaryAccentColor   )
              .cornerRadius(10.0)
          })
          .padding(.horizontal, animate ? CGFloat(50) : CGFloat(50))
          .shadow(
            color: animate ? primaryAccentColor : secondaryAccentColor,
            radius: animate ? 30 : 10,
            x: 0.0,
            y: animate ? 30 : 10
          )
          .scaleEffect(animate ? 1.1 : 1.0)
          .offset(y: animate ? -7 : 0)
      }
      .multilineTextAlignment(.center)
      .padding(40)
      .onAppear(perform: addAnimation)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
  
  func addAnimation() -> Void {
    /// This guard statement prevents running the animation twice
    guard !animate else { return }
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
      withAnimation(
        Animation
          .easeInOut(duration: 2.0)
          .repeatForever()
      ) {
        animate.toggle()
      }
    }
  }
}

struct NoTodoItemsView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      NoTodoItemsView(listViewModel: ListViewModel())
        .navigationBarTitle("Development Title")
    }
  }
}
