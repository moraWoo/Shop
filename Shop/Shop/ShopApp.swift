//
//  ShopApp.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI
import Combine

//@main
//struct ShopApp: App {
//    let viewAssembly: ViewAssembly
//
//    lazy var appCoordinator: AppCoordinator = {
//        return AppCoordinator(viewAssembly: viewAssembly)
//    }()
//
//    var body: some Scene {
//        WindowGroup {
//            appCoordinator.currentView
//                .environmentObject(appCoordinator)
//        }
//    }
//}
@main
struct ShopApp: App {
    let appCoordinator: AppCoordinator
    let viewAssembly: ViewAssembly

    init() {
        self.appCoordinator = AppCoordinator(viewAssembly: self.viewAssembly)
        self.viewAssembly = DefaultViewAssembly(coordinator: appCoordinator)
    }
    
    var body: some Scene {
        WindowGroup {
            appCoordinator.currentView
                .environmentObject(appCoordinator)
        }
    }
}





