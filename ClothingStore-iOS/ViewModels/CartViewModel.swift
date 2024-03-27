//
//  CartViewModel.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-27.
//

import Foundation

class CartViewModel: ObservableObject{
    func totalCartPrice() -> Double {
        return GlobalVariables.globalCart.reduce(0.0) { $0 + $1.item.price }
    }
}
