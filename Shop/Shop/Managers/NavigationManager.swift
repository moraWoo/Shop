import SwiftUI
import Combine

class NavigationManager: ObservableObject {
    @Published var currentView: AnyView?
    @Published var previousView: AnyView?
    
    func navigateTo(view: AnyView) {
        previousView = currentView
        currentView = view
    }
    
    func navigateBack() {
        currentView = previousView
        previousView = nil
    }
}
