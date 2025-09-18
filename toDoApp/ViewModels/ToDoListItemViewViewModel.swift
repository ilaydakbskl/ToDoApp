//
//  ToDoListItemViewViewModel.swift
//  toDoApp
//
//  Created by ilymily on 7.09.2025.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
class ToDoListItemViewViewModel: ObservableObject {
    init () {}
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(uid).collection("toDos").document(item.id).setData(itemCopy.asDictionary())
    }
}
