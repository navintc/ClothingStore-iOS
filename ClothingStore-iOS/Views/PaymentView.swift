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
    @State private var addressname = ""
    @State private var cardNumber = ""
    @State private var expDate = ""
    @State private var cvv = ""
    @State private var address1 = ""
    @State private var address2 = ""
    @State private var city = ""
    @State private var country = ""

    var body: some View {
        VStack {
            Spacer()
            Form {
                Section(header: Text("Payment Information")) {
                    TextField("Name", text: $name)
                        .textContentType(.name)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                    TextField("Card Number", text: $cardNumber)
                        .keyboardType(.numberPad)
                        .textContentType(.creditCardNumber)
                    TextField("Exp Date", text: $expDate)
                        .keyboardType(.numbersAndPunctuation)
                    TextField("CVV", text: $cvv)
                        .keyboardType(.numberPad)
                        .textContentType(.creditCardSecurityCode)
                }

                Section(header: Text("Shipping Details")) {
                    TextField("Name", text: $addressname)
                        .textContentType(.name)
                        .autocapitalization(.words)
                        .disableAutocorrection(true)
                    TextField("Address 1", text: $address1)
                    TextField("Address 2", text: $address2)
                    TextField("City", text: $city)
                    TextField("Country", text: $country)
                }
            }
                
            HStack {
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
//            .navigationBarTitle("NAV ANDRS")
//            .navigationBarItems(
//                leading: Spacer(),
//                trailing:
//                    HStack {
//                        Button(action: {
//                            // Action for right icon 1
//                        }) {
//                            Image(systemName: "cart.fill")
//                                .foregroundColor(BrandPrimary)
//                        }
//
//                        Button(action: {
//                            // Action for right icon 2
//                            isSidebarShowing.toggle()
//                        }) {
//                            Image(systemName: "circle.grid.3x3.fill")
//                                .foregroundColor(BrandPrimary)
//                        }
//                    }
//            )
        .navigationTitle("Payment Details")
        .sheet(isPresented: $isSidebarShowing) {
            // sidebar content
            CatagoriesView()
        }
    }
}

#Preview {
    PaymentView()
}
