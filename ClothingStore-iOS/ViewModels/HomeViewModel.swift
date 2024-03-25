//
//  HomeViewModel.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-26.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var cloths: [Cloth] = []
    
    func loadData() {
        guard let url = URL(string: "http://localhost:3000/api/cloths") else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Cloth].self, from: data) {
                    DispatchQueue.main.async {
                        self.cloths = decodedResponse
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

