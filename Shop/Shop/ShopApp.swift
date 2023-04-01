import SwiftUI
import Combine

@main
struct ShopApp: App {
    
    let assembly: AppAssembly

    @ObservedObject var appCoordinator: AppCoordinator = {
        let dependencies = AppDependencies()
        return AppAssembly.assemble(dependencies: dependencies)
    }()
    
    init() {
        let dependencies = AppDependencies()
        assembly = AppAssembly()
        appCoordinator = AppAssembly.assemble(dependencies: dependencies)
    }

    var body: some Scene {
        
        let contentView = appCoordinator.start().environmentObject(appCoordinator)
        WindowGroup {
            contentView.environmentObject(appCoordinator)
        }
    }
}
