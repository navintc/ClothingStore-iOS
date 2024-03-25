//
//  ClothModel.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-26.
//

struct Cloth: Codable, Identifiable {
    let id: Int
    let name: String
    let category: String
    let price: Double
    let imageurl: String
    let descrip: String
    let color: String
    let colorHex: String
}
