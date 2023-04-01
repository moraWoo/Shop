import SwiftUI
import Combine

@main
struct ShopApp: App {
    
    let assembly: AppAssembly

    @StateObject var appCoordinator: AppCoordinator = {
        return AppCoordinator()
    }()

    init() {
        assembly = AppAssembly()
        
    }

    var body: some Scene {
        
        WindowGroup {
            AppAssembly.assemble()
                .environmentObject(appCoordinator)
        }
    }
}
