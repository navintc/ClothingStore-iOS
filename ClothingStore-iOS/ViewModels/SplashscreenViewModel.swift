//
//  SplashscreenViewModel.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-31.
//

import Foundation

class SplashscreenViewModel: ObservableObject {
    @Published var isAppReady = false
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isAppReady = true
        }
    }
}
