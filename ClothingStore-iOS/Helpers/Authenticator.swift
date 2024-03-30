//
//  Authenicator.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-29.
//

import Foundation

class Authenticator: ObservableObject {
    @Published var isAuthenticated: Bool = false
    static let shared = Authenticator()
    
    static var id: Int?
    static var name: String?
    static var email: String?
    static var age: Int?
    static var gender: String?
}
