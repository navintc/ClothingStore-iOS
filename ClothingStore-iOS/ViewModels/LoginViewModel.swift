//
//  LoginViewModel.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-28.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() {
        print("DEBUG: \(email) , \(password)")
        guard let url = URL(string: "http://localhost:3000/api/login") else {
            print("Invalid URL")
            return
        }
        
        let requestBody = [
            "email": email,
            "passwd": password
        ]
        
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody, options: [])
        
        URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            guard let data = data else {
                print("No data in response: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            if let userResponse = try? JSONDecoder().decode(User.self, from: data) {
                print("DEBUG: Halfway through - userResponse success")
                DispatchQueue.main.async {
                    Authenticator.shared.isAuthenticated = true
                    Authenticator.id = userResponse.id
                    Authenticator.name = userResponse.name
                    Authenticator.email = userResponse.email
                    Authenticator.age = userResponse.age
                    Authenticator.gender = userResponse.gender
                }
            } else {
                print("DEBUG: Invalid credentials")
                DispatchQueue.main.async {
                    Authenticator.shared.isAuthenticated = false
                }
            }
        }.resume()
    }
}
