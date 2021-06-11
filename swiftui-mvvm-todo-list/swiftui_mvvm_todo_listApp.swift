//
//  swiftui_mvvm_todo_listApp.swift
//  swiftui-mvvm-todo-list
//
//  Created by Rick Brown on 11/06/2021.
//

import SwiftUI

/**
 MVVM architecture
 
 model  - data point
 view - the ui components
 view model - manages models for the views
 
 */
@main
struct swiftui_mvvm_todo_listApp: App {
  var body: some Scene {
    WindowGroup {
      NavigationView {
        ListView()
      }
    }
  }
}
