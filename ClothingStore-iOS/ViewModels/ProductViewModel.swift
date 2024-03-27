//
//  ProoductViewModel.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-26.
//

import Foundation

class ProductViewModel: ObservableObject {
    @Published var selectedSize = "M"
    @Published var showAlert: Bool = false
    @Published var alertMessage: String = ""
    
    func addToCart(product: Cloth) {
        GlobalVariables.globalCart.append(CartElement(item: product, size: selectedSize))
        addedAlert(itemName: product.name)
        
        print("DEBUG: Current cart list --")
        for item in GlobalVariables.globalCart {
            print(item.item.name)
        }
    }
    
    func addedAlert(itemName: String) {
        alertMessage = "\(itemName) - Size: \(selectedSize) added to the cart"
        showAlert = true
        
    }
}
