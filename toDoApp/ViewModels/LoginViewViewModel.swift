//
//  LoginViewViewModel.swift
//  toDoApp
//
//  Created by ilymily on 7.09.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
//gözlemlenebilir obje demektir
//login() sadece "login sürecini yönetiyor".
//validate() sadece "doğrulama işini yapıyor".
class LoginViewViewModel : ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var message: String = ""
    
    init() {}
        
    func login() {
        guard validate() else { return }
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.message = "There is no user record corresponding to this identifier!"
                return
            }
            
        }
    }
    func validate() -> Bool {
        //guard hemen kaçış demek devamındaki hiçbir şey yapılmaz
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
              message = "Please complete all fields!"
              return false
        }
        guard email.contains("@") && email.contains(".") else{
            message = "Please enter a valid email address!"
            return false
        }
        return true
    }
        
    
    
}
