//
//  ProoductViewModel.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-26.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var selectedSize = "M"
    
    func addToCart(product: Cloth) {
        // Add logic here to add the product to the cart
        print("Added product to cart: \(product.name), Size: \(selectedSize)")
    }
}
