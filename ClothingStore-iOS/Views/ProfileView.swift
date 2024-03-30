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
                    TextField("Age", text: $viewModel.age)
                    TextField("Gender", text: $viewModel.gender)
                    TextField("Email", text: $viewModel.email)
                }
                Section(header: Text("Password")) {
                    SecureField("New Password", text: $viewModel.newpasswd)
                    SecureField("Enter New Password again", text: $viewModel.newpasswd2)
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
    }
}


#Preview {
    ProfileView()
}
