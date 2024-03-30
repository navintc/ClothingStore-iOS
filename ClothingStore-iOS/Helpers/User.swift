//
//  User.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-29.
//

import Foundation

struct User: Codable {
    var id: Int
    var name: String
    var email: String
    var age: Int
    var gender: String
}

struct UserUpdate: Codable {
    var name: String
    var email: String
    var age: Int
    var gender: String
    var passwd: String
}
