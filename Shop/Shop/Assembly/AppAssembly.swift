import SwiftUI

class AppAssembly {
    static func assemble() -> some View {
        let dependencies = AppDependencies()
        let appCoordinator = AppCoordinator()
        
        appCoordinator.dependencies = dependencies
                
        let signUpAssembly = SignUpAssembly(dependencies: dependencies)
        let signUpView = signUpAssembly.assemble(appCoordinator: appCoordinator)
        
        appCoordinator.currentView = AnyView(signUpView)
        
        return AnyView(appCoordinator.currentView)
            .environmentObject(appCoordinator)
    }
}
