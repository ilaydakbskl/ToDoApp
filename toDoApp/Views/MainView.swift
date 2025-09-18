//
//  ContentView.swift
//  toDoApp
//
//  Created by ilymily on 7.09.2025.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
            
        }
        else{
            LoginView()
        }
        
    }
    @ViewBuilder
    var accountView: some View {
        TabView{
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem{
                    Label("Notes", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                    
                }
        }
        .accentColor(.yellow) // <-- ikon ve seçili metin sarı olacak

    }
}
#Preview {
    MainView()
}
