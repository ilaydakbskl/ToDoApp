//
//  NewItemViewViewModel.swift
//  toDoApp
//
//  Created by ilymily on 7.09.2025.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth
class NewItemViewViewModel: ObservableObject {
    @Published var text = ""
    @Published var date: Date = Date()
    @Published var showAlert = false
    var itemId: String? = nil
    var isEditing: Bool {itemId != nil}

    init(){}
    init (item: ToDoListItem){
        self.text = item.text
        self.date = Date(timeIntervalSince1970: item.date)
        self.itemId = item.id
    }
    func save(){
        guard canSave else {
            return
        }
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
       
        let db = Firestore.firestore()
        if let itemId = itemId{
            db.collection("users")
                .document(uId)
                .collection("toDos")
                .document(itemId)
                .updateData(["text": text, "date": date.timeIntervalSince1970])
            return
        }else{
            let newItemId = UUID().uuidString
            let newItem = ToDoListItem(id: newItemId, text: text, date: date.timeIntervalSince1970, creatDate: Date().timeIntervalSince1970, isDone: false)
            db.collection("users")
                .document(uId)
                .collection("toDos")
                .document(newItemId)
                .setData(newItem.asDictionary())
        }
        
       
        
        
    }
    var canSave: Bool {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else { return false }
        guard date >= Date().addingTimeInterval(-86400) else{
            return false
        }
        return true
        
    }
}
