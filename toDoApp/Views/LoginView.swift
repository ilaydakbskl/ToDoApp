//
//  LoginView.swift
//  toDoApp
//
//  Created by ilymily on 7.09.2025.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginViewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationStack{
            
            HeaderView()
            if !loginViewModel.message.isEmpty {
                Text(loginViewModel.message)
                    .foregroundStyle(.primary)
                    .fontWeight(.bold)
                    .padding()
            }
            TextField("Your Email" ,text: $loginViewModel.email)
                .autocorrectionDisabled()
                .autocapitalization(.none)
                .padding()
                .background(.yellow .opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
            SecureField("Password" ,text: $loginViewModel.password)
                .padding()
                .background(.yellow .opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
            Button {
                loginViewModel.login()
            } label: {
                Text("Sign In")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.yellow)
                    .cornerRadius(10)
                    .padding()
            }
            HStack{
                Text("Don't have an account?")
                    .foregroundStyle(.secondary)
                    .font(.headline)
               
                NavigationLink("Sign Up", destination: RegisterView())
                    .foregroundStyle(.yellow)
                    .font(.headline)
                    .fontWeight(.bold)
            }
            

        }
    }
}

#Preview {
    LoginView()
}
