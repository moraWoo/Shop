//
//  ShopApp.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI

@main
struct ShopApp: App {
    @StateObject var appCoordinator = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            appCoordinator.currentView
                .environmentObject(appCoordinator)
        }
    }
}
