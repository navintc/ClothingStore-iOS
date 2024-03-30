//
//  PaymentSuccess.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-29.
//

import SwiftUI

struct PaymentSuccessView: View {
    @Binding var shouldPopToRootView : Bool
    @ObservedObject var updateTrigger: CartUpdateTrigger
    var body: some View {
        VStack{
            
            Spacer()
            VStack{
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundColor(BrandPrimary)
                    .symbolEffect(.variableColor.iterative, options: .repeating, value: true)

                
                Text("Payment Success").font(.title)
            }
            
            Spacer()
            Button(action: {
                // Action for checkout button
                GlobalVariables.globalCart.removeAll()
                updateTrigger.shouldClearCart = true
                self.shouldPopToRootView = false
                
            }) {
                Text("Continue")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(BrandPrimary)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
        }
        .padding()
        .navigationTitle("Payment")
    }
}
