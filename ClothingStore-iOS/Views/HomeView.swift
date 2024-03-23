//
//  HomeView.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-17.
//

import SwiftUI
import Kingfisher

struct Cloth: Codable, Identifiable {
    let id: Int
    let name: String
    let category: String
    let price: Double
    let imageurl: String
    let descrip: String
    let color: String
    let colorHex: String
}


struct HomeView: View {
    
    @State private var isSidebarShowing = false
    
    @State private var cloths: [Cloth] = []

        
    let sampleImageURL = "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?q=80&w=1620&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
    
    @State private var searchText = ""

    func loadData() {
        guard let url = URL(string: "http://localhost:3000/api/cloths") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Cloth].self, from: data) {
                    DispatchQueue.main.async {
                        self.cloths = decodedResponse
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }

    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                //scroll content
                ScrollView {
                    
                    //hero image
                    KFImage.url(URL(string:"https://i.ibb.co/T1fzbwr/Group-12.png")).resizable().scaledToFill().frame(height: 200).cornerRadius(1)
                    
                    HStack {
                        Text("Our Listings")
                            .font(.title)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .alignmentGuide(.leading) { _ in 0 }
                    }
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))

                    //Item Grid
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                        ForEach(cloths) { product in
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
                                        .foregroundColor(Color("Primary"))
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
                        NavigationLink(destination: CartView()) {
                                Image(systemName: "cart.fill")
                                    .foregroundColor(Color("Primary"))
                        }
                        
                        Button(action: {
                            isSidebarShowing.toggle()
                        }) {
                            Image(systemName: "circle.grid.3x3.fill")
                                .foregroundColor(Color("Primary"))
                        }
                    }
            )
            .onAppear {
                loadData()
            }
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
