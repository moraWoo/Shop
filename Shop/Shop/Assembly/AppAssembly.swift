import SwiftUI

class AppAssembly {
    
    static func assemble(dependencies: AppDependencies) -> AppCoordinator {
        
        let appCoordinator = AppCoordinator(dependencies: dependencies)
        
        let signUpCoordinator = SignUpCoordinator(dependencies: dependencies)
        appCoordinator.addChildCoordinator(signUpCoordinator)

        // Запускаем AppCoordinator, который автоматически отобразит SignUpCoordinator
        _ = appCoordinator.start()
        
        return appCoordinator
    }
}
