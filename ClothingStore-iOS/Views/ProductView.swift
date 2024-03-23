//
//  ProductView.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-22.
//

import SwiftUI
import Kingfisher

extension Color {
    init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}

struct ProductView: View {
    @State private var isSidebarShowing = false
    let sizes = ["XS", "S", "M", "L", "XL", "XXL"]
        @State private var selectedSize = "M"
    
    var product: Cloth
    @State private var products: [Cloth] = []
    
    var body: some View {
        NavigationView {
            VStack {
                
                ScrollView{
                    KFImage.url(URL(string: product.imageurl)).resizable().scaledToFill().frame(width: 350, height: 250).cornerRadius(5).padding(10)
                    
                    VStack{
                        HStack{
                            Text(product.name)
                                .font(.title2)
                            Spacer()
                        }
                        HStack{
                            Text(product.category)
                                .font(.callout)
                            Spacer()
                        }
                        
                    }.padding(.horizontal, 20)
                    
                    VStack{
                        HStack{
                            Text(product.descrip)
                                .font(.caption)
                                .padding(.vertical, 1)
                            Spacer()
                        }
                        
                        
                    }.padding(.horizontal, 20)
                }
                .background(Color("BackgroundAccent"))
                
                Spacer()
                
                VStack{
                    
                    VStack{
                        HStack{
                            Rectangle()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color(hex: product.colorHex))
                                .cornerRadius(5)
                            
                            VStack{
                                Text("Color")
                                    .font(.caption)
                                    .padding(.horizontal, 20)
                                    .multilineTextAlignment(.leading)
                                Text(product.color)
                                    .font(.callout)
                                    .padding(.horizontal, 20)
                                    .multilineTextAlignment(.leading)
                            }
                            .multilineTextAlignment(.leading)
                            
                            Spacer()
                            
                            Text("$\(product.price, specifier: "%.2f")")
                                .font(.title2)
                                .padding(.horizontal, 20)
                                .multilineTextAlignment(.leading)
                        }
                        
                    }
                    .padding(20)
                    
                    HStack{
                        VStack {
                            Text("Selected Size: \(selectedSize)")
                                .padding()
                                .multilineTextAlignment(.leading)
                        }
                        Spacer()
                        VStack{

                            Picker("Size", selection: $selectedSize) {
                                ForEach(sizes, id: \.self) { size in
                                    Text(size).tag(size)
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            .frame(width: 150, height: 100)
                        }
                    }
                    .padding(.horizontal, 10)
                    
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
                            Text("Pay")
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color("Primary"))
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .padding()
                    
                }
                
                
                
            }
         
        }
        
        
    }
}

