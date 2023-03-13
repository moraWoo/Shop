//
//  SingInCoordinator.swift
//  Shop
//
//  Created by Ильдар on 13.03.2023.
//

import SwiftUI
import Combine

class SignInCoordinator: NSObject, Coordinator {
    @Published var currentView: AnyView

    func start() -> AnyView {
        let signInView = viewAssembly.createSignInView()
        return AnyView(signInView)    }
    
    var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
        
    private let signInViewModel = SignInViewModel()
    private let loginViewModel = LoginViewModel()
    
    private var signInView: SignInView?
    private var loginView: LoginView?
    
    let viewAssembly: ViewAssembly
    
    init(viewAssembly: ViewAssembly) {
        self.viewAssembly = viewAssembly
        self.currentView = AnyView(viewAssembly.createSignInView())
    }
    
//    func start() -> some View {
//            // Создаем SignInView и передаем ему signInViewModel
//            let signInView = SignInView(viewModel: signInViewModel)
//
//            // Сохраняем ссылку на signInView, чтобы можно было показать SignUpView позже
//            self.signInView = signInView
//
////            // Устанавливаем обработчик нажатия на кнопку "Войти"
////            signInViewModel.signInButtonTapped = { [weak self] in
////                // Проверяем, что логин и пароль введены правильно
////                if self?.signInViewModel.isValid == true {
////                    // Показываем главный экран
////                    self?.showMainView()
////                } else {
////                    // Если данные введены неверно, то показываем ошибку
////                    self?.signInViewModel.showAlert = true
////                }
////            }
////
////            // Устанавливаем обработчик нажатия на кнопку "Зарегистрироваться"
////            signInViewModel.signUpButtonTapped = { [weak self] in
////                // Показываем экран регистрации
////                self?.showSignUpView()
////            }
//
//            return AnyView(signInView)
//        }
    
    func showLoginView() {
            // Создаем SignUpView и передаем ему signUpViewModel
//            let loginView = LoginView(viewModel: LoginViewModel)
//
//            // Сохраняем ссылку на signUpView, чтобы можно было вернуться на него позже
//            self.loginView = loginView
//
//            // Устанавливаем обработчик нажатия на кнопку "Зарегистрироваться"
//            loginViewModel.signUpButtonTapped = { [weak self] in
//                // Проверяем, что все данные введены правильно
//                if self?.signUpViewModel.isValid == true {
//                    // Показываем главный экран
//                    self?.showMainView()
//                } else {
//                    // Если данные введены неверно, то показываем ошибку
//                    self?.signUpViewModel.showAlert = true
//                }
//            }
//
//            // Устанавливаем обработчик нажатия на кнопку "Назад"
//            signUpViewModel.backButtonTapped = { [weak self] in
//                // Удаляем ссылку на signUpView
//                self?.signUpView = nil
//
//                // Показываем signInView
//                if let signInView = self?.signInView {
//                    self?.parentCoordinator?.present(signInView)
//                }
//            }
//
//            // Показываем signUpView
//            parentCoordinator?.present(signUpView)
        }
    func showMainView() {
//        // Создаем главный экран и передаем ему необходимые данные
//        let mainView = MainView(username: signInViewModel.username)
//
//        // Устанавливаем обработчик нажатия на кнопку "Выйти"
//        mainView.onLogoutButtonTapped = { [weak self] in
//            // Возвращаемся на signInView
//            self?.parentCoordinator
//            // Удаляем ссылки на signInView и signUpView
//            self?.signInView = nil
//            self?.signUpView = nil
//
//            // Удаляем ссылку на self из родительского координатора
//            self?.parentCoordinator?.removeChildCoordinator(self)
//        }
//
//        // Показываем главный экран
//        parentCoordinator?.present(mainView)
    }
    
    func addChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    
    func removeChildCoordinator(_ coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
    
}
