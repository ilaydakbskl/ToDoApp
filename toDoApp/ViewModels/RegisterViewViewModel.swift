//
//  RegisterViewViewModel.swift
//  toDoApp
//
//  Created by ilymily on 7.09.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class RegisterViewViewModel : ObservableObject{
    @Published var fullNameRegister : String = ""
    @Published var emailRegister: String = ""
    @Published var passwordRegister : String = ""
    @Published var message : String = ""
    
    init(){}
    
    func register(){
        guard validate() else {
            return 
        }
        Auth.auth().createUser(withEmail: emailRegister, password: passwordRegister) { result, error in
            if let error = error {
                self.message = "There is a user registration corresponding to this email address! "
            }
            guard let userId = result?.user.uid else {
                return
            }
           
            self.insertRecord(id: userId)
        }
    }
    private func insertRecord(id: String){
        let newUser = User(id: id, name: fullNameRegister, email: emailRegister, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    func validate() -> Bool{
        guard !fullNameRegister.trimmingCharacters(in: .whitespaces).isEmpty, !emailRegister.trimmingCharacters(in: .whitespaces).isEmpty, !passwordRegister.trimmingCharacters(in: .whitespaces).isEmpty else {
            message = "Please complete all fields!"
            return false
            
        }
        guard emailRegister.contains("@") && emailRegister.contains(".") else {
            message = "Please enter a valid email address!"
            return false
        }
        guard passwordRegister.count >= 6 else {
            message = "Password must be at least 6 characters long!"
            return false
        }
        return true
    }
}
