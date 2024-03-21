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
    
    @State private var isSidebarShowing = false
    let cartItems: [CartItem] = [
        CartItem(name: "Product 1", category: "Category A", price: 10.99, quantity: 1, imageName: "product1"),
        CartItem(name: "Product 2", category: "Category A", price: 19.99, quantity: 2, imageName: "product2"),
        CartItem(name: "Product 3", category: "Category B", price: 15.99, quantity: 1, imageName: "product3"),
        CartItem(name: "Product 4", category: "Category C", price: 24.99, quantity: 3, imageName: "product4")
    ]

    var body: some View {
        
        NavigationView {
            VStack {
                
                Spacer()
                HStack{
                    Text("Cart")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(20)
                }
                //scroll content
                ScrollView {
                    //Item Grid
                    ScrollView {
                        ForEach(cartItems) { item in
                            HStack {
                                KFImage.url(URL(string:"https://www.optimized-rlmedia.io/is/image/PoloGSI/s7-1501060_alternate5?$plpDeskRF$"))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(8)
                                
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
                                        .foregroundColor(Color("Alert"))
                                }
                            }
                            .padding()
                            .background(Color(UIColor.systemBackground))
                            .cornerRadius(10)
                        }
                    }

                    .padding()
                }
                .background(Color.gray.opacity(0.1).ignoresSafeArea())
                
                Spacer()
                     
                
                VStack{
                    HStack {
                        Text("Total:")
                            .font(.headline)
                        Spacer()
                        Text("$53795")
                            .font(.headline)
                    }
                    .padding()
                    
                    HStack {
                        Button(action: {
                                        // Action for back button
                        }) {
                            Text("Back")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.gray.opacity(0.5))
                                .foregroundColor(Color("Primary"))
                                .cornerRadius(10)
                        }
                        
                        Button(action: {
                            // Action for checkout button
                        }) {
                            Text("Checkout")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color("Primary"))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
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

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}


#Preview {
    CartView()
}
