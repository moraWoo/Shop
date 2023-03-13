//
//  ContentView.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appCoordinator: AppCoordinator
    
    var body: some View {
        
        switch appCoordinator.currentScreen {
            case .main:
                MainView()
            case .details:
                DetailsView()
            case .login:
                LogingView()
            case .singIn:
                SingInView()
            case .profile:
                ProfileView()
        }
    }
}
