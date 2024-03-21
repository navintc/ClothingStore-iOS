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
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
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
                    
                    Button(action: {
                        // Action for checkout button
                    }) {
                        Text("Login")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color("Primary"))
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
                                .foregroundColor(Color("Primary"))
                                .cornerRadius(10)
                        }
                    }.padding(.vertical, 50)
                }
                .padding()
                .edgesIgnoringSafeArea(.all)
                
               
                VStack {
                    Text("By logging in, you agree to our Terms of Service and Privacy Policy. You also agree to receive marketing communications from us.")
                        .font(.caption)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)
                        .lineLimit(nil) // Allow the text to have unlimited lines
                        .minimumScaleFactor(0.5) // Allow the text to shrink down to half its size if needed
                        .foregroundColor(Color.gray.opacity(1))
                }
                Spacer()
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
                                .foregroundColor(Color("Primary"))
                        }
                        
                        Button(action: {
                            // Action for right icon 2
                            isSidebarShowing.toggle()
                        }) {
                            Image(systemName: "circle.grid.3x3.fill")
                                .foregroundColor(Color("Primary"))
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

#Preview {
    SigninView()
}
