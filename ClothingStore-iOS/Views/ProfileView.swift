//
//  ProfileView.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-21.
//

import SwiftUI

struct ProfileView: View {
    @State private var isSidebarShowing = false
    // Initialize @State properties with values from Authenticator
    @State private var name = Authenticator.name ?? ""
    @State private var email = Authenticator.email ?? ""
    @State private var password = ""
    @State private var age = "\(Authenticator.age ?? 0)"
    @State private var gender = Authenticator.gender ?? ""
    
    @State private var newpasswd = ""
    @State private var newpasswd2 = ""
    
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("Name", text: $name)
                    TextField("Age", text: $age)
                    TextField("Gender", text: $gender)
                    TextField("Email", text: $email)
                }
                Section(header: Text("Password")) {
                    TextField("New Password", text: $newpasswd)
                    TextField("Enter New Password again", text: $newpasswd2)
                }
            }
            
            HStack {
                
                
                Button(action: {
                    // Action for checkout button
                    updateProfile()
                }) {
                    Text("Update")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(BrandPrimary)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .navigationTitle("Profile")
            .padding()
        }
    }
    
    func updateProfile() {
        guard let url = URL(string: "http://localhost:3000/api/users/\(Authenticator.id ?? 0)") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        if (newpasswd == newpasswd2){
            let updatedUser = UserUpdate(name: name, email: email, age: Int(age) ?? 0, gender: gender, passwd: newpasswd2)
            guard let jsonData = try? JSONEncoder().encode(updatedUser) else { return }
            
            request.httpBody = jsonData
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    // Handle the successful response, updating Authenticator as necessary
                    DispatchQueue.main.async {
                        // Assuming the response includes updated user information
                        if let userResponse = try? JSONDecoder().decode(User.self, from: data) {
                            // Update Authenticator with the new data
                            Authenticator.name = userResponse.name
                            Authenticator.email = userResponse.email
                            Authenticator.age = userResponse.age
                            Authenticator.gender = userResponse.gender
                            // Handle password separately as it might not be returned in response
                        }
                    }
                } else {
                    print("Failed to update profile: \(error?.localizedDescription ?? "Unknown error")")
                }
            }.resume()
        }
    }
}

#Preview {
    ProfileView()
}
