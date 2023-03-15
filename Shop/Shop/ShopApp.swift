//
//  ShopApp.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI
import Combine

@main
struct ShopApp: App {
    let assembly: AppAssembly

    @StateObject var appCoordinator: AppCoordinator = {
        return AppCoordinator()
    }()

    init() {
        assembly = AppAssembly()
    }

    var body: some Scene {
        let contentView = appCoordinator.start().environmentObject(appCoordinator)
        WindowGroup {
            contentView.environmentObject(appCoordinator)
        }
    }
}









