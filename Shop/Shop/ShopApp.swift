import SwiftUI
import Combine

@main
struct ShopApp: App {

    @ObservedObject var appCoordinator: AppCoordinator

    init() {
        let dependencies = AppDependencies()
        appCoordinator = AppCoordinator(dependencies: dependencies)
    }
    var body: some Scene {

        let contentView = appCoordinator.start().environmentObject(appCoordinator)

        WindowGroup {
            contentView.environmentObject(appCoordinator)
        }
    }
}
