//
//  MainViewViewModel.swift
//  toDoApp
//
//  Created by ilymily on 7.09.2025.
//

import Foundation
import FirebaseAuth
class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    init(){
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
