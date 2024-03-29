//
//  ContentView.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-17.
//

import SwiftUI

struct ContentView: View {
    @State private var isAuthenticated = false

    var body: some View {
        if isAuthenticated {
            HomeView()
        } else {
            LoginView(authObj: Authenticator.shared, isAuthenticated: $isAuthenticated)
        }
    }
}

#Preview {
    ContentView()
}

 
