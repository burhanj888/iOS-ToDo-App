//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Burhanuddin Jinwala on 10/25/23.
//
import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
