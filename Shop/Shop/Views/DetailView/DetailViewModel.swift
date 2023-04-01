import Combine

class DetailViewModel: ObservableObject {
        
    let appCoordinator: AppCoordinator
    private let detailCoordinator: DetailCoordinator
    
    init(
        appCoordinator: AppCoordinator,
        detailCoordinator: DetailCoordinator
    ) {
        self.appCoordinator = appCoordinator
        self.detailCoordinator = detailCoordinator
    }
}


