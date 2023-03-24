import Foundation

class DetailViewModel: ObservableObject {
    @Published var coordinator: DetailCoordinator?
    let networkManager: NetworkManager

    init(coordinator: DetailCoordinator, networkManager: NetworkManager) {
        self.coordinator = coordinator
        self.networkManager = networkManager
    }
}

