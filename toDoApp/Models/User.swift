//
//  User.swift
//  toDoApp
//
//  Created by ilymily on 7.09.2025.
//

import Foundation
struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
