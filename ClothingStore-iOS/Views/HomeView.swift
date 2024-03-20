//
//  HomeView.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-17.
//

import SwiftUI
import Kingfisher

struct ClothingProduct: Identifiable {
    var id = UUID()
    var name: String
    var category: String
    var price: Double
}

struct HomeView: View {
    
    @State private var isSidebarShowing = false

    let products: [ClothingProduct] = [
            ClothingProduct(name: "T-Shirto", category: "Men's Clothing", price: 19.99),
            ClothingProduct(name: "Jeans", category: "Women's Clothing", price: 39.99),
            ClothingProduct(name: "Dress Shirt", category: "Men's Clothing", price: 29.99),
            ClothingProduct(name: "Skirt", category: "Women's Clothing", price: 24.99),
            // Add more clothing products as needed
        ]
        
        let sampleImageURL = "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=1620&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
        
        @State private var searchText = ""

        var body: some View {
            NavigationView {
                VStack {
                    SearchbarView(searchText: $searchText);
                    Spacer()
                    
                    //scroll content
                    ScrollView {
                        
                        //hero image
                        KFImage.url(URL(string:"https://i.ibb.co/T1fzbwr/Group-12.png")).resizable().scaledToFill().frame(height: 200).cornerRadius(1)
                        
                        HStack {
                            Text("For You")
                                .font(.title)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .alignmentGuide(.leading) { _ in 0 }
                        }
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))

                        //Item Grid
                        LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                            ForEach(products) { product in
                                VStack(alignment: .leading, spacing: 8) {
                                    KFImage.url(URL(string:sampleImageURL)).resizable().scaledToFill().frame(height: 150).cornerRadius(8)
                                    
                                    Text(product.name)
                                        .font(.headline)
                                    
                                    Text(product.category)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    
                                    Text("$\(product.price, specifier: "%.2f")")
                                        .font(.headline)
                                        .foregroundColor(.blue)
                                }
                                .padding()
                                .background(Color(UIColor.systemBackground))
                                .cornerRadius(10)
                                
                            }
                        }
                        .padding()
                    }
                    .background(Color.gray.opacity(0.1).ignoresSafeArea())
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
                                    .foregroundColor(Color("indigo"))
                            }
                            
                            Button(action: {
                                // Action for right icon 2
                                isSidebarShowing.toggle()
                            }) {
                                Image(systemName: "circle.grid.3x3.fill")
                                    .foregroundColor(Color("indigo"))
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
    HomeView()
}
