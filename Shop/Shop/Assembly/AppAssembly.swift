//
//  AppAssembly.swift
//  Shop
//
//  Created by Ильдар on 14.03.2023.
//

import SwiftUI

class AppAssembly {
    
    static func assemble() -> some View {
        let dependencies = AppDependencies(
            signUpCoordinator: SignUpCoordinator(),
            loginCoordinator: LoginCoordinator(),
            mainCoordinator: MainCoordinator(),
            personInfoCoordinator: PersonInfoCoordinator(),
            detailCoordinator: DetailCoordinator()
        )
        
        let appCoordinator = AppCoordinator()
        
        let signUpAssembly = SignUpAssembly(dependencies: dependencies)
        let loginAssembly = LoginAssembly(dependencies: dependencies)
        let mainAssembly = MainAssembly(dependencies: dependencies)
        let personInfoAssembly = PersonInfoAssembly(dependencies: dependencies)
        let detailAssembly = DetailAssembly(dependencies: dependencies)

        
        appCoordinator.addChildCoordinator(signUpAssembly.dependencies.signUpCoordinator)
        appCoordinator.addChildCoordinator(loginAssembly.dependencies.loginCoordinator)
        appCoordinator.addChildCoordinator(mainAssembly.dependencies.mainCoordinator)
        appCoordinator.addChildCoordinator(personInfoAssembly.dependencies.personInfoCoordinator)
        appCoordinator.addChildCoordinator(detailAssembly.dependencies.detailCoordinator)

        
        print("AppCoordinator child coordinators:", appCoordinator.childCoordinators)
        print("MainCoordinator parent coordinator:", mainAssembly.dependencies.mainCoordinator.parentCoordinator)
        
        return AnyView(signUpAssembly.assemble())
    }
}
