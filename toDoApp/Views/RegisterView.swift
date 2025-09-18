//
//  RegisterView.swift
//  toDoApp
//
//  Created by ilymily on 7.09.2025.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var registerViewModel = RegisterViewViewModel()
    var body: some View {
        NavigationStack{
            
            HeaderView()
            if !registerViewModel.message.isEmpty {
                Text(registerViewModel.message)
                    .foregroundStyle(.primary)
                    .fontWeight(.bold)
                    .padding()
            }
            TextField("Full Name" ,text: $registerViewModel.fullNameRegister)
                .autocorrectionDisabled()
                
                .padding()
                .background(.yellow .opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
            TextField("Your Email" ,text: $registerViewModel.emailRegister)
                .autocorrectionDisabled() //otomatik tamamlama kapalı
                .autocapitalization(.none) //baş harfleri büyütme
                .padding()
                .background(.yellow .opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
            SecureField("Password" ,text: $registerViewModel.passwordRegister)
                .padding()
                .background(.yellow .opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
            Button {
                registerViewModel.register()
                
            } label: {
                Text("Sign Up")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .padding()
            }
            
            

        }
    }
}

#Preview {
    RegisterView()
}
