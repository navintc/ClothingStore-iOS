//
//  AppDelegate.swift
//  ClothingStore-iOS
//
//  Created by Navin Thamindu on 2024-03-29.
//

import UIKit
import SwiftUI

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Perform any setup after launching the app
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            // Broadcast a notification when the device is shaken
            NotificationCenter.default.post(name: NSNotification.Name("DeviceShaken"), object: nil)
            print("DEBUG: Device shaken from appdelegate:motion ended")
        }
    }
}
