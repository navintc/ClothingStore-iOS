//
//  ClothingStore_iOSApp.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-17.
//

import SwiftUI

@main
struct ClothingStore_iOSApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
//    @StateObject var viewModel = SplashscreenViewModel()

    var body: some Scene {
        WindowGroup {
//            if viewModel.isAppReady {
                ContentView()
//            } else {
//                SplashscreenView()
//            }
        }
    }
}
