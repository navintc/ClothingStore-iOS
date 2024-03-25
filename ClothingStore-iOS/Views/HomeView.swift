//
//  HomeView.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-17.
//

import SwiftUI
import Kingfisher

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var isSidebarShowing = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                ScrollView {
                    KFImage.url(URL(string:"https://i.ibb.co/T1fzbwr/Group-12.png")).resizable().scaledToFill().frame(height: 200).cornerRadius(1)
                    
                    HStack {
                        Text("Our Listings")
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .alignmentGuide(.leading) { _ in 0 }
                    }
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))

                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                        ForEach(viewModel.cloths) { product in
                            NavigationLink(destination: ProductView(product: product)) {
                                VStack(alignment: .leading, spacing: 8) {
                                    KFImage.url(URL(string:product.imageurl)).resizable().scaledToFill().frame(height: 150).cornerRadius(8)
                                    
                                    Text(product.name)
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.leading)
                                    
                                    Text(product.category)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    
                                    Text("$\(product.price, specifier: "%.2f")")
                                        .font(.headline)
                                        .foregroundColor(BrandPrimary)
                                }
                                .padding()
                                .background(Color(UIColor.systemBackground))
                                .cornerRadius(10)
                            }
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
                        NavigationLink(destination: SearchView()) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(BrandPrimary)
                        }
                        
                        NavigationLink(destination: CartView()) {
                            Image(systemName: "cart.fill")
                                .foregroundColor(BrandPrimary)
                        }
                        
                        Button(action: {
                            isSidebarShowing.toggle()
                        }) {
                            Image(systemName: "circle.grid.3x3.fill")
                                .foregroundColor(BrandPrimary)
                        }
                    }
            )
            .onAppear {
                viewModel.loadData()
            }
            .sheet(isPresented: $isSidebarShowing) {
                CatagoriesView()
            }
        }
    }
}


#Preview {
    HomeView()
}
