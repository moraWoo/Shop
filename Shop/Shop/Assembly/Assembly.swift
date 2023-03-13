//
//  Assembly.swift
//  Shop
//
//  Created by Ильдар on 14.03.2023.
//

import SwiftUI

protocol ViewAssembly {
    func createSignInView() -> SignInView
    func createLoginView() -> LoginView
    func createProfileView() -> ProfileView
    func createMainView() -> MainView
    func createDetailsView() -> DetailsView
}

class DefaultViewAssembly: ViewAssembly {
    private let signInViewModel: SignInViewModel
    private let loginViewModel: LoginViewModel
    private let profileViewModel: ProfileViewModel
    private let mainViewModel: MainViewModel
    private let detailsViewModel: DetailsViewModel
    
    init(coordinator: Coordinator) {
        self.signInViewModel = SignInViewModel()
        self.loginViewModel = LoginViewModel()
        self.profileViewModel = ProfileViewModel()
        self.mainViewModel = MainViewModel(coordinator: coordinator)
        self.detailsViewModel = DetailsViewModel()
    }
    
    func createSignInView() -> SignInView {
        SignInView(viewModel: signInViewModel)
    }
    
    func createLoginView() -> LoginView {
        LoginView(viewModel: loginViewModel)
    }
    
    func createProfileView() -> ProfileView {
        ProfileView(viewModel: profileViewModel)
    }
    
    func createMainView() -> MainView {
        MainView(viewModel: mainViewModel)
    }
    
    func createDetailsView() -> DetailsView {
        DetailsView(viewModel: detailsViewModel)
    }
}
