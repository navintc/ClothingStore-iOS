//
//  CartUpdateTrigger.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-31.
//

import Foundation

class CartUpdateTrigger: ObservableObject {
    @Published var shouldClearCart: Bool = false
}
