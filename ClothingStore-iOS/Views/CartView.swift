//
//  CartView.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-19.
//

import SwiftUI
import Kingfisher

struct CartItem: Identifiable {
    var id = UUID()
    var name: String
    var category: String
    var price: Double
    var quantity: Int
    var imageName: String // Image name for demonstration purposes
}

struct CartView: View {
    let cartItems: [CartItem] = [
        CartItem(name: "Product 1", category: "Category A", price: 10.99, quantity: 1, imageName: "product1"),
        CartItem(name: "Product 2", category: "Category A", price: 19.99, quantity: 2, imageName: "product2"),
        CartItem(name: "Product 3", category: "Category B", price: 15.99, quantity: 1, imageName: "product3"),
        CartItem(name: "Product 4", category: "Category C", price: 24.99, quantity: 3, imageName: "product4")
    ]

    var body: some View {
        
        List(cartItems) { item in
            HStack {
                
                KFImage.url(URL(string:"https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=1620&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")).resizable().scaledToFill().frame(width: 70, height: 70).cornerRadius(8)
                
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    Text("\(item.quantity) x $\(item.price, specifier: "%.2f")")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(item.category)
                        .font(.caption)
                        .foregroundColor(.gray)
                        
                }
                .padding(10)
                
                Spacer()
                
                Button(action: {
                    // Action for trash button
                }) {
                    Image(systemName: "trash")
                        .foregroundColor(.red)
                }
            }
            

        }
        HStack {
            Text("Total:")
                .font(.headline)
            Spacer()
            Text("$5500")
                .font(.headline)
        }
        .padding()
        .listStyle(InsetGroupedListStyle())
        .navigationBarTitle("Cart")
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}


#Preview {
    CartView()
}
