//
//  ContentView.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-17.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var authenticator = Authenticator.shared

    var body: some View {
        if authenticator.isAuthenticated {
            HomeView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    ContentView()
}

 
