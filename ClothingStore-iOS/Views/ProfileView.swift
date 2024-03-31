//
//  ProfileView.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-21.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("Name", text: $viewModel.name)
                        .textContentType(.name)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                    TextField("Age", text: $viewModel.age)
                        .keyboardType(.numberPad)
                    TextField("Gender", text: $viewModel.gender)
                        .textContentType(.name)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                    TextField("Email", text: $viewModel.email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .disableAutocorrection(true)
                }
                Section(header: Text("Password")) {
                    SecureField("New Password", text: $viewModel.newpasswd)
                    SecureField("Enter New Password again", text: $viewModel.newpasswd2)
                }
                Button(action: {
                    // Action for the underlined text button
                    Authenticator.id = nil
                    Authenticator.name = ""
                    Authenticator.email = ""
                    Authenticator.age = nil
                    Authenticator.gender = ""
                    Authenticator.shared.isAuthenticated = false
                }) {
                    Text("Log out")
                       
                }
            }
            
            Button("Update") {
                viewModel.updateProfile()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue) // Replace with your BrandPrimary color
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding()

            // Present an alert if needed
            .alert(isPresented: $viewModel.showingAlert) {
                Alert(title: Text("Update Profile"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
            }
        }
        .navigationTitle("Profile")
    }
}


#Preview {
    ProfileView()
}
