//
//  PaymentView.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-20.
//

import SwiftUI

struct PaymentView: View {
    @State private var isSidebarShowing = false
    @State private var name = ""
        @State private var email = ""
        @State private var password = ""


    var body: some View {
        
        NavigationView {
            VStack {
                
                Spacer()
                
                //scroll content
                
                    //Item Grid
                    
                        Form {
                            Section(header: Text("Payment Information")) {
                                TextField("Name", text: $name)
                                TextField("Number", text: $email)
                                TextField("Exp date", text: $email)
                                TextField("CVV", text: $email)
                            }
                            
                            Section(header: Text("Shipping Details")) {
                                TextField("Name", text: $password)
                                TextField("Address 1", text: $password)
                                TextField("Address 2", text: $password)
                                TextField("City", text: $password)
                                TextField("Country", text: $password)
                            }
                        }
                        
                        HStack {
                            Button(action: {
                                            // Action for back button
                            }) {
                                Text("Back")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(Color.gray.opacity(0.5))
                                    .foregroundColor(BrandPrimary)
                                    .cornerRadius(10)
                            }
                            
                            Button(action: {
                                // Action for checkout button
                            }) {
                                Text("Pay")
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(BrandPrimary)
                                    .foregroundColor(.white)
                                    .cornerRadius(10)
                            }
                        }
                        .padding()
                        
                    
               
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

        
    }}

#Preview {
    PaymentView()
}
