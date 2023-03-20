//
//  AppDependecies.swift
//  Shop
//
//  Created by Ильдар on 14.03.2023.
//

import Foundation

class AppDependencies {
    let signUpCoordinator: SignUpCoordinator
    var loginCoordinator: LoginCoordinator
    let mainCoordinator: MainCoordinator
    let personInfoCoordinator: PersonInfoCoordinator
    let detailCoordinator: DetailCoordinator
    let userRepository: UserRepository

    init(
        signUpCoordinator: SignUpCoordinator,
        loginCoordinator: LoginCoordinator,
        mainCoordinator: MainCoordinator,
        personInfoCoordinator: PersonInfoCoordinator,
        detailCoordinator: DetailCoordinator
    ) {
        self.loginCoordinator = loginCoordinator
        self.signUpCoordinator = signUpCoordinator
        self.mainCoordinator = mainCoordinator
        self.personInfoCoordinator = personInfoCoordinator
        self.detailCoordinator = detailCoordinator
        self.userRepository = UserRepository()
    }
}
