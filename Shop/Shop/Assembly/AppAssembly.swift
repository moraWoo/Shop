import SwiftUI

class AppAssembly {
    
    static func assemble(dependencies: AppDependencies) -> AppCoordinator {
        
        let appCoordinator = AppCoordinator(dependencies: dependencies)
        
        return appCoordinator
    }
}


