//
//  ToDoApp.swift
//  ToDo
//
//  Created by Julia Sikorski on 02.12.23.
//

import SwiftUI
 
@main
struct ToDoApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
