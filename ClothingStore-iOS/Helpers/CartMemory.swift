//
//  File.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-26.
//

import Foundation

struct CartElement: Identifiable {
    var id = UUID()
    var item: Cloth
    var size: String
}

struct GlobalVariables {
    static var globalCart: [CartElement] = []
    
    static func deleteItem(withId id: UUID) {
        globalCart.removeAll { $0.id == id }
    }
}
