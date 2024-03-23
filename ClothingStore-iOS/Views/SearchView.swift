//
//  SearchView.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-18.
//

import SwiftUI
import Kingfisher

struct ClothingProductK: Identifiable {
    var id = UUID()
    var name: String
    var category: String
    var price: Double
}

struct SearchView: View {
    
    @State private var isSidebarShowing = false
    @State private var isShowingPopover = false
    @State private var searchText = ""
    @State private var resultedQuery = ""
    @State private var searchResults: [Cloth] = []
    
    func searchCloths(query: String) {
        guard let url = URL(string: "http://localhost:3000/api/cloths/search?query=\(query)") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Cloth].self, from: data) {
                    DispatchQueue.main.async {
                        self.searchResults = decodedResponse
                        self.resultedQuery = searchText
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }

    var body: some View {
        VStack {
            SearchbarView(searchText: $searchText, onSearch: searchCloths)
            
            //scroll content
            ScrollView {
                VStack{
                    HStack {
                        Text("Searching for '\(resultedQuery)'")
                        .font(.callout)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .alignmentGuide(.leading) { _ in 0 }
                        Spacer();
                        
                        Button(action: {
                            // Action for right icon 1
                        }) {
                            Image(systemName: "slider.horizontal.3")
                            .foregroundColor(Color("Primary"))
                            Text("Refine").font(.caption)
                            .foregroundColor(Color("Primary"))
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                }
                

                //Item Grid
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {

                    ForEach(searchResults) { cloth in
                        NavigationLink(destination: ProductView(product: cloth)) {
                            VStack(alignment: .leading, spacing: 8) {
                                KFImage.url(URL(string:cloth.imageurl)).resizable().scaledToFill().frame(height: 150).cornerRadius(8)
                                
                                Text(cloth.name)
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                    .multilineTextAlignment(.leading)
                                
                                Text(cloth.category)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                Text("$\(cloth.price, specifier: "%.2f")")
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
        .navigationTitle("Cart")

        
    }
}

#Preview {
    SearchView()
}

