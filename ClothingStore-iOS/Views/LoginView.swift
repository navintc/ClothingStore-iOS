//
//  LoginView.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-20.
//

import SwiftUI
import Auth0

struct LoginView: View {
//    @ObservedObject var viewModel: LoginViewModel
    
    @State private var isSidebarShowing = false
    
    @ObservedObject var authObj: Authenticator
    @Binding var isAuthenticated: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                HStack{
                    Text("Log in")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(20)
                }
                
                VStack {
//                    TextField("Email", text: $viewModel.email)
//                        .padding(.vertical, 10)
//                        .padding(.horizontal)
//                        .background(Color.gray.opacity(0.2))
//                        .cornerRadius(8)
//                        .autocapitalization(.none)
//                        .keyboardType(.emailAddress)
//                        .disableAutocorrection(true)
//                    
//                    SecureField("Password", text: $viewModel.password)
//                        .padding(.vertical, 10)
//                        .padding(.horizontal)
//                        .background(Color.gray.opacity(0.2))
//                        .cornerRadius(8)
                    
                    Button(action: {
                        Auth0
                            .webAuth()
                            .useHTTPS() // Use a Universal Link callback URL on iOS 17.4+ / macOS 14.4+
                            .start { result in
                                switch result {
                                case .success(let credentials):
                                    print("Obtained credentials: \(credentials)")
                                    authObj.isAuthenticated = true
                                    isAuthenticated = true // Update the binding
                                    print("DEBUG: from loginbtn -\(authObj.isAuthenticated)")
                                    
                                case .failure(let error):
                                    print("Failed with: \(error)")
                                }
                            }
                    }) {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(BrandPrimary)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    VStack{
                        Text("Still dont have an account?")
                            .font(.caption)
                        
                        Button(action: {
                            // Action for checkout button
                        }) {
                            Text("Sign in")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.gray.opacity(0.5))
                                .foregroundColor(BrandPrimary)
                                .cornerRadius(10)
                        }
                    }.padding(.vertical, 50)
                }
                .padding()
                .edgesIgnoringSafeArea(.all)
                
                Spacer()
                
                VStack {
                    Text("By logging in, you agree to our Terms of Service and Privacy Policy. You also agree to receive marketing communications from us.")
                        .font(.caption)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                        .lineLimit(nil) // Allow the text to have unlimited lines
                        .minimumScaleFactor(0.5) // Allow the text to shrink down to half its size if needed
                        .foregroundColor(Color.gray.opacity(1))
                }
            }
            .navigationBarTitle("NAV ANDRS")
            .navigationBarItems(
                leading: Spacer(),
                trailing:
                    HStack {
                        Button(action: {
                            // Action for right icon 1
                        }) {
                            Image(systemName: "cart.fill")
                                .foregroundColor(BrandPrimary)
                        }
                        
                        Button(action: {
                            // Action for right icon 2
                            isSidebarShowing.toggle()
                        }) {
                            Image(systemName: "circle.grid.3x3.fill")
                                .foregroundColor(BrandPrimary)
                        }
                    }
            )
            .sheet(isPresented: $isSidebarShowing) {
                // sidebar content
                CatagoriesView()
            }
        }
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        let viewModel = LoginViewModel() // Assuming you have a LoginViewModel
//        
//        return LoginView(viewModel: viewModel)
//    }
//}
