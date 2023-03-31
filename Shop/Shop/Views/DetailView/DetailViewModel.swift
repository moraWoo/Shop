import Combine

class DetailViewModel: ObservableObject {
    
    let coordinator: DetailCoordinator
    let networkManager: NetworkManager
    let navigationManager: NavigationManager

    init(
        coordinator: DetailCoordinator,
        networkManager: NetworkManager,
        navigationManager: NavigationManager
    ) {
        self.coordinator = coordinator
        self.networkManager = networkManager
        self.navigationManager = navigationManager
    }
}


