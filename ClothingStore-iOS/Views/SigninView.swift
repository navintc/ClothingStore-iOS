//
//  SigninView.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-20.
//

import SwiftUI

struct SigninView: View {
    @State private var isSidebarShowing = false
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var password2 = ""
    @State private var gender = ""
    @State private var age = ""
    
    @State private var showingAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
   
        VStack {
            Spacer()
            VStack{
                Text("NAV ANDRS")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity)  
                Text("The luxury clothing universe")
                    .font(.title3)
                    .frame(maxWidth: .infinity)
            }
            .padding(20)
            HStack{
                Text("Sign in")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
            }
            
            VStack {
                TextField("Name", text: $name)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                TextField("Age", text: $age)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                TextField("Gender", text: $gender)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                TextField("Email", text: $email)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                SecureField("Password", text: $password)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                SecureField("Enter Password Again", text: $password2)
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                
                Button(action: {
                    // Action for checkout button
                    signUp()
                }) {
                Text("Sign in")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(BrandPrimary)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            .padding()
            .edgesIgnoringSafeArea(.all)
            
           
            VStack {
                Text("By Signing in, you agree to our Terms of Service and Privacy Policy. You also agree to receive marketing communications from us.")
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 20)
                    .lineLimit(nil) // Allow the text to have unlimited lines
                    .minimumScaleFactor(0.5) // Allow the text to shrink down to half its size if needed
                    .foregroundColor(Color.gray.opacity(1))
            }
            Spacer()
        }
        .navigationTitle("Sign In")
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Sign Up"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    
    func signUp() {
        guard let url = URL(string: "http://localhost:3000/api/users") else {
            self.alertMessage = "Invalid URL."
            self.showingAlert = true
            return
        }
        
        if (password == password2){
            let user = UserUpdate(name: name, email: email, age: Int(age) ?? 0, gender: gender, passwd: password)
            
            guard let jsonData = try? JSONEncoder().encode(user) else {
                self.alertMessage = "Failed to encode user data."
                self.showingAlert = true
                return
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 {
                    DispatchQueue.main.async {
                        self.alertMessage = "Sign up successful!"
                        self.showingAlert = true
                    }
                } else {
                    DispatchQueue.main.async {
                        self.alertMessage = "Sign up failed: \(error?.localizedDescription ?? "Unknown error")"
                        self.showingAlert = true
                    }
                }
            }.resume()
        } else {
            self.alertMessage = "Passwords are not matching"
            self.showingAlert = true
        }
    }
}

#Preview {
    SigninView()
}
