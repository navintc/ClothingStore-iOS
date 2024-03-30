//
//  CatagoriesView.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-18.
//

import SwiftUI
import Kingfisher

struct CatagoriesView: View {
    let onCategorySelect: (String) -> Void
    @Binding var selectedCategory: String?

    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 4)
                .fill(Color.gray)
                .frame(width: 150, height: 5)
                .padding()
            HStack {
                Text("Browse Categories")
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .alignmentGuide(.leading) { _ in 0 }
            }
            .padding(EdgeInsets(top: 8, leading: 25, bottom: 0, trailing: 16))
            
            HStack {
                ScrollView {
                    
                    
                    //Item Grid
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 2) {
                        
                        VStack {
                            KFImage.url(URL(string: "https://images.unsplash.com/photo-1612722432474-b971cdcea546?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTh8fGRyZXNzfGVufDB8fDB8fHww")).resizable().scaledToFill().frame(width: 150, height: 150).cornerRadius(8)
                            Text("Dresses")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .cornerRadius(10)
                        .onTapGesture {
                            onCategorySelect("Dress") // Call the dismiss function, which will now trigger navigation
                        }
                        
                        VStack {
                            KFImage.url(URL(string: "https://www.optimized-rlmedia.io/is/image/PoloGSI/s7-1502958_alternate10?$plpDeskRF$"))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .cornerRadius(8)
                            
                            Text("Polo TShirts")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .cornerRadius(10)
                        .onTapGesture {
                            onCategorySelect("tshirt") // Call the dismiss function, which will now trigger navigation
                        }
                        
                        VStack {
                            KFImage.url(URL(string: "https://www.optimized-rlmedia.io/is/image/PoloGSI/s7-1474895_alternate10?$plpDeskRFAlt$"))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .cornerRadius(8)
                            
                            Text("Shirts")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .cornerRadius(10)
                        .onTapGesture {
                            onCategorySelect("Shirt") // Call the dismiss function, which will now trigger navigation
                        }
                        
                        
                        VStack {
                            KFImage.url(URL(string: "https://images.unsplash.com/photo-1541099649105-f69ad21f3246?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cGFudHN8ZW58MHx8MHx8fDA%3D"))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .cornerRadius(8)
                            
                            Text("Pants")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .cornerRadius(10)
                        .onTapGesture {
                            onCategorySelect("Pant") // Call the dismiss function, which will now trigger navigation
                        }
                        
                        VStack {
                            KFImage.url(URL(string: "https://images.unsplash.com/photo-1595137976825-b906534240a5?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8c2hvcnRzfGVufDB8fDB8fHww"))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .cornerRadius(8)
                            
                            Text("Shorts")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .cornerRadius(10)
                        .onTapGesture {
                            onCategorySelect("Short") // Call the dismiss function, which will now trigger navigation
                        }
                        
                        VStack {
                            KFImage.url(URL(string: "https://www.optimized-rlmedia.io/is/image/PoloGSI/s7-1501060_alternate5?$plpDeskRF$"))
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 150)
                                .cornerRadius(8)
                            
                            Text("Misc")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        .padding()
                        .cornerRadius(10)
                        .onTapGesture {
                            onCategorySelect("Misc") // Call the dismiss function, which will now trigger navigation
                        }
                    }
                    
                }
            }
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
      
        }
        
    }
}
