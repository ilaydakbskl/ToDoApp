//
//  ProfileView.swift
//  toDoApp
//
//  Created by ilymily on 7.09.2025.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView {
            VStack {
                
                if let user = viewModel.user{
                    profile(user: user)
                }
                

                VStack(alignment: .leading){
                    Button {
                    } label: {
                        HStack{
                            Image(systemName: "person.circle")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.yellow)

                            Text("Edit Profile")
                                .font(.headline)
                                .fontWeight(.regular)
                                .foregroundStyle(.black)
                        }.padding()
                        
                    }

                   
                    HStack{
                        Image(systemName: "bell.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.yellow)

                        Text("Notifications")
                            .font(.headline)
                            .fontWeight(.regular)
                            
                    }.padding(.horizontal)
                    HStack{
                        Image(systemName: "questionmark.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.yellow)

                        Text("Help")
                            .font(.headline)
                            .fontWeight(.regular)
       
                    }.padding()
                    HStack{
                        Button {
                            viewModel.logOut()
                        } label: {
                            Image(systemName: "door.left.hand.closed")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(.yellow)

                            Text("Logout")
                                .font(.headline)
                                .fontWeight(.regular)
                                .foregroundStyle(.black)
                        }

                        
                            
                    }.padding(.horizontal)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            //.navigationTitle("Profile")
            
        }
        .onAppear{
            viewModel.fetchUser()
        }
        
    }
    @ViewBuilder
    func profile(user: User) -> some View {
        Image("profilelogo2")
        
            .resizable()
            .scaledToFit()
            .clipShape(.circle)
            .frame(width: 120, height: 120)
            
        Text(user.name)
            .font(.title)
            .fontWeight(.bold)
            .padding(.bottom, 50)
    }
}

#Preview {
    ProfileView()
}
