//
//  ToDoListViewViewModel.swift
//  toDoApp
//
//  Created by ilymily on 7.09.2025.
//
import FirebaseFirestore
import Foundation
class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    private var userId: String
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("toDos")
            .document(id)
            .delete()
    }

}
