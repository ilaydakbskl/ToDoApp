//
//  toDoAppApp.swift
//  toDoApp
//
//  Created by ilymily on 7.09.2025.
//
import FirebaseCore
import SwiftUI

@main
struct toDoAppApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
