import SwiftUI
import Combine

class NavigationManager: ObservableObject, NavigationManagerProtocol {
    @Published var currentView: AnyView?
    @Published var previousView: AnyView?
    @Published var customTabBar: AnyView?
    
    func navigateTo(view: AnyView) {
        previousView = currentView
        currentView = view
    }
    
    func navigateBack() {
        currentView = previousView
        previousView = nil
    }
}
