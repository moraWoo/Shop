//
//  AppDependecies.swift
//  Shop
//
//  Created by Ильдар on 14.03.2023.
//

import Foundation

class AppDependencies {
    var loginCoordinator: LoginCoordinator
    let mainCoordinator: MainCoordinator
    
    init(loginCoordinator: LoginCoordinator, mainCoordinator: MainCoordinator) {
        self.loginCoordinator = loginCoordinator
        self.mainCoordinator = mainCoordinator
    }
}
