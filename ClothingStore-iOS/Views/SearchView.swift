//
//  SearchView.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-18.
//

import SwiftUI
import Kingfisher
import UIKit

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @State private var sortOption: SearchViewModel.SortOption?
    

    var body: some View {
        
            VStack {
                SearchbarView(searchText: $viewModel.searchText, onSearch: viewModel.searchCloths)
                
                ScrollView {
                    VStack {
                        HStack {
                            Text("Searching for '\(viewModel.resultedQuery)'")
                                .font(.callout)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .alignmentGuide(.leading) { _ in 0 }
                            Spacer()
                           
                            Menu {
                                ForEach(SearchViewModel.SortOption.allCases, id: \.self) { option in
                                    Button(option.rawValue) {
                                        sortOption = option
                                        viewModel.sortResults(sortOption: option)
                                    }
                                }
                            } label: {
                                Image(systemName: "slider.horizontal.3")
                                    .foregroundColor(BrandPrimary)
                                Text("Refine").font(.caption)
                                    .foregroundColor(BrandPrimary)
                            }
                        }
                        .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                    }
                    
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 16) {
                        ForEach(viewModel.searchResults) { cloth in
                            NavigationLink(destination: ProductView(product: cloth)) {
                                VStack(alignment: .leading, spacing: 8) {
                                    KFImage.url(URL(string: cloth.imageurl)).resizable().scaledToFill().frame(height: 150).cornerRadius(8)
                                    
                                    Text(cloth.name)
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.leading)
                                    
                                    Text(cloth.category)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    
                                    Text("$\(cloth.price, specifier: "%.2f")")
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
            .navigationTitle("Cart")
            
                
        }
    }
}

#Preview {
    SearchView()
}

