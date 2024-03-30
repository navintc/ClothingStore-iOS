//
//  CatSearchViewModel.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-30.
//

import Foundation

class CatSearchViewModel: ObservableObject {
    @Published var resultedQuery = ""
    @Published var searchResults: [Cloth] = []
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(deviceShaken), name: NSNotification.Name("DeviceShaken"), object: nil)
    }

    @objc func deviceShaken() {
        resetFilters()
        print("DEBUG: Device shaken")
    }
    
    func fetchClothCategory(cat: String) {
        let urlString = "http://localhost:3000/api/cloths/category/\(cat)"
        print(urlString)
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            if let data = data, error == nil {
                
                do {
                    let decodedResponse = try JSONDecoder().decode([Cloth].self, from: data)
                    DispatchQueue.main.async {
                        self?.searchResults = decodedResponse
                    }
                } catch {
                    print("Decoding failed: \(error.localizedDescription)")
                }
            } else {
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            }
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
    
    func resetFilters() {
        searchResults.sort(by: SortOption.reset.sortDescriptor)
    }
}

