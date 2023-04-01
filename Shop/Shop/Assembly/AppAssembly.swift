import SwiftUI

class AppAssembly {
    
    static func assemble() -> some View {
        
        let dependencies = AppDependencies()
        let appCoordinator = AppCoordinator(dependencies: dependencies)
        
        let signUpCoordinator = SignUpCoordinator(dependencies: dependencies)
        appCoordinator.addChildCoordinator(signUpCoordinator)

        // Запускаем AppCoordinator, который автоматически отобразит SignUpCoordinator
        let appView = appCoordinator.start()
        
        return AnyView(appView)
    }
}
