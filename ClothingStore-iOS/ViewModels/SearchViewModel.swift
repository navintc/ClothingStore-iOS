//
//  SearchViewModel.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-26.
//

import Foundation
import SwiftUI


class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var resultedQuery = ""
    @Published var searchResults: [Cloth] = []
    
    func searchCloths(query: String) {
        guard let url = URL(string: "http://localhost:3000/api/cloths/search?query=\(query)") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode([Cloth].self, from: data) {
                    DispatchQueue.main.async {
                        self.searchResults = decodedResponse
                        self.resultedQuery = query
                    }
                    return
                }
            }
            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    
    
    func sortResults(sortOption: SortOption) {
        searchResults.sort(by: sortOption.sortDescriptor)
    }

    enum SortOption: String, CaseIterable {
        case nameAscending = "A-Z"
        case nameDescending = "Z-A"
        case priceAscending = "Lowest price to highest"
        case priceDescending = "Highest Price to Lowest"
        case reset = "Reset sorting"
        
        var sortDescriptor: (Cloth, Cloth) -> Bool {
            switch self {
            case .nameAscending:
                return { $0.name < $1.name }
            case .nameDescending:
                return { $0.name > $1.name }
            case .priceAscending:
                return { $0.price < $1.price }
            case .priceDescending:
                return { $0.price > $1.price }
            case .reset:
                return { $0.id < $1.id }
            }
        }
    }

}

