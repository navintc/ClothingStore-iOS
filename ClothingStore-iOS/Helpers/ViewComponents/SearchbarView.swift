//
//  SearchbarView.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-18.
//

import SwiftUI

struct SearchbarView: View {
    @Binding var searchText: String

    var body: some View {
        VStack{
            HStack {
                TextField("Search", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: {
                    // Perform search action
                }) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color("Primary"))
                }
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
        }
    }
}
