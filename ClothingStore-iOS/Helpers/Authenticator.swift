//
//  Authenicator.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-29.
//

import Foundation
import JWTDecode


class Authenticator: ObservableObject {
    @Published var isAuthenticated: Bool = false
    static let shared = Authenticator()

    private init() {}

    func login() {
        // Perform login logic here
        isAuthenticated = true
    }

    func logout() {
        // Perform logout logic here
        isAuthenticated = false
    }
}
