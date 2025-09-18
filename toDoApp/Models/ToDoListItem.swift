//
//  ToDoListItem.swift
//  toDoApp
//
//  Created by ilymily on 7.09.2025.
//

import Foundation
struct ToDoListItem: Codable, Identifiable {
    let id: String 
    var text: String
    var date: TimeInterval
    var creatDate: TimeInterval
    var isDone: Bool
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
