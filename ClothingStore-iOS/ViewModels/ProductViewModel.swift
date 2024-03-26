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
        GlobalVariables.globalCart.append(CartElement(item: product, size: selectedSize))
        
        print("DEBUG: Current cart list --")
        for item in GlobalVariables.globalCart {
            print(item.item.name)
        }
    }
}
