//
//  LoginViewModel.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-28.
//

import Foundation
import Combine


final class LoginViewModel: ObservableObject {

    @Published var email = ""
    @Published var password = ""

    @Published var hasError = false
    @Published var isSigningIn = false

    var canSignIn: Bool {
        !email.isEmpty && !password.isEmpty
    }

    func signIn() {
        guard !email.isEmpty && !password.isEmpty else {
            return
        }
    }

}
