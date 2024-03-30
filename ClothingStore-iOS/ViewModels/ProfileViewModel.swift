//
//  ProfileViewModel.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-30.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var age: String = ""
    @Published var gender: String = ""
    @Published var newpasswd: String = ""
    @Published var newpasswd2: String = ""
    
    @Published var showingAlert: Bool = false
    @Published var alertMessage: String = ""

    init() {
        // Initialize with values from Authenticator
        name = Authenticator.name ?? ""
        email = Authenticator.email ?? ""
        age = "\(Authenticator.age ?? 0)"
        gender = Authenticator.gender ?? ""
    }

    func updateProfile() {
        guard let userID = Authenticator.id, let url = URL(string: "http://localhost:3000/api/users/\(userID)") else {
            alertMessage = "Invalid URL or User ID"
            showingAlert = true
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        if (newpasswd == newpasswd2) {
            let updatedUser = UserUpdate(name: name, email: email, age: Int(age) ?? 0, gender: gender, passwd: newpasswd2)
            guard let jsonData = try? JSONEncoder().encode(updatedUser) else { return }

            request.httpBody = jsonData

            URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
                if let data = data {
                    DispatchQueue.main.async {
                        if let userResponse = try? JSONDecoder().decode(User.self, from: data) {
                            Authenticator.name = userResponse.name
                            Authenticator.email = userResponse.email
                            Authenticator.age = userResponse.age
                            Authenticator.gender = userResponse.gender
                            self?.showingAlert = true // Trigger the alert
                            self?.alertMessage = "Profile Updated"
                        }
                    }
                } else {
                    DispatchQueue.main.async {
                        self?.alertMessage = "Failed to update profile: \(error?.localizedDescription ?? "Unknown error")"
                        self?.showingAlert = true
                    }
                }
            }.resume()
        } else {
            alertMessage = "Passwords do not match"
            showingAlert = true
        }
    }
}
