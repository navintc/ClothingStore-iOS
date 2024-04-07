//
//  SplashscreenView.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-31.
//

import SwiftUI

struct SplashscreenView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground).edgesIgnoringSafeArea(.all)
            ProgressView("Loading...")
                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                .scaleEffect(2)
        }
    }
}
#Preview {
    SplashscreenView()
}
