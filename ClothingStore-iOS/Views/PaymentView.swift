//
//  PaymentView.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-20.
//

import SwiftUI
import LocalAuthentication

struct PaymentView: View {
    @State private var isSidebarShowing = false
    @State private var name: String = ""
    @State private var addressname: String  = ""
    @State private var cardNumber: String = ""
    @State private var expDate = ""
    @State private var cvv: String = ""
    @State private var address1: String  = ""
    @State private var address2: String  = ""
    @State private var city: String  = ""
    @State private var country: String  = ""
    
    @State private var paymentSuccess = false
    
    @Binding var rootIsActive : Bool
    
    @ObservedObject var updateTrigger = CartUpdateTrigger()

    
    var body: some View {
        
        VStack {
            NavigationLink(destination: PaymentSuccessView(shouldPopToRootView: self.$rootIsActive, updateTrigger: updateTrigger), isActive: $paymentSuccess) {
                EmptyView()
            }
            .isDetailLink(false)
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
                    authenticateUser { success, error in
                        if success {
                            // Authentication was successful, proceed with the payment
                            makePaymentRequest()
                            paymentSuccess = true
                        } else {
                            // Authentication failed
                            print(error?.localizedDescription ?? "Authentication failed")
                            paymentSuccess = false
                        }
                    }
                    
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
        .navigationTitle("Payment Details")
    }
    
    func authenticateUser(completion: @escaping (Bool, Error?) -> Void) {
        let context = LAContext()
        context.localizedFallbackTitle = "Use Passcode" // Optionally customize the fallback button title

        // Reason shown in the authentication dialog.
        let reason = "Please authenticate to proceed."

        context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason) { success, error in
            DispatchQueue.main.async {
                if success {
                    // Authentication was successful
                    completion(true, nil)
                } else {
                    // Authentication failed
                    completion(false, error)
                }
            }
        }
    }

    
    func makePaymentRequest() {
        let items = GlobalVariables.globalCart.map { "\($0.item.id)-\($0.size)" }.joined(separator: ", ")
        let payment = GlobalVariables.globalCart.reduce(0) { $0 + $1.item.price }
        
        let parameters: [String: Any] = [
            "name": name,
            "payment": payment,
            "addressname": addressname,
            "address1": address1,
            "address2": address2,
            "city": city,
            "items": items,
            "country": country
        ]
        
        guard let url = URL(string: "http://localhost:3000/api/bills") else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            print("Failed to create HTTP body")
            return
        }
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            } else if let data = data {
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        print("Payment successful")
                        // Clear the global cart here
                        GlobalVariables.globalCart.removeAll()
                    } else {
                        print("Unexpected status code: \(httpResponse.statusCode)")
                    }
                }
            }
        }.resume()
    }
}
