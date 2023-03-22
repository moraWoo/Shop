import Foundation

class DetailViewModel: ObservableObject {
    var coordinator: DetailCoordinator
    
    init(coordinator: DetailCoordinator) {
        self.coordinator = coordinator
    }
}

