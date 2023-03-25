import SwiftUI
import Combine

class MainViewModel: ObservableObject {
    @Published var profileImage: UIImage?
    @Published var firstName: String?
    @Published var items: [[Any]] = [[], [], []]

    var coordinator: MainCoordinator
    var personInfoCoordinator: PersonInfoCoordinator
    var detailCoordinator: DetailCoordinator

    let navigationManager: NavigationManager

    private let userRepository: UserRepository
    private let networkManager: NetworkManager
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(
        coordinator: MainCoordinator,
        personInfoCoordinator: PersonInfoCoordinator,
        userRepository: UserRepository,
        networkManager: NetworkManager,
        navigationManager: NavigationManager
    ) {
        self.coordinator = coordinator
        self.personInfoCoordinator = personInfoCoordinator
        self.userRepository = userRepository
        self.networkManager = networkManager
        self.navigationManager = navigationManager

        if let currentUser = userRepository.currentUser,
           let avatarData = currentUser.avatar {
            profileImage = UIImage(data: avatarData)
        }
        
        fetchLatestAndFlashSaleProducts()
        fetchLoggedInUser()
    }
    
    func goToMainView() {
        coordinator.goToMainView()
        coordinator.parentCoordinator?.addChildCoordinator(coordinator)
    }
    
    func personInfo() {
        goToPersonInfoView()
    }
    
    func goToPersonInfoView() {
        guard let parentCoordinator = coordinator.parentCoordinator as? AppCoordinator else {
            print("Parent coordinator is nil")
            return
        }
        
        parentCoordinator.removeChildCoordinator(personInfoCoordinator)
        personInfoCoordinator.parentCoordinator = parentCoordinator
        parentCoordinator.addChildCoordinator(personInfoCoordinator)
        
        let personInfoView = personInfoCoordinator.start()
        
        parentCoordinator.currentView = personInfoView
    }
    
    func fetchLoggedInUser() {
        userRepository.fetchLoggedInUser()
            .sink { user in
                self.firstName = user?.firstName
            }
            .store(in: &cancellableSet)
    }
    
    func fetchAvatar() {
        userRepository.fetchAvatar()
            .sink { image in
                self.profileImage = image
            }
            .store(in: &cancellableSet)
    }

    func fetchLatestAndFlashSaleProducts() {
        networkManager.fetchLatestAndFlashSale()
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    print("Successfully fetched latest and flash sale products")
                case .failure(let error):
                    print("Error fetching latest and flash sale products: \(error)")
                }
            } receiveValue: { [weak self] (latestProductsResponse, flashSaleResponse) in
                DispatchQueue.main.async {
                    self?.items[0] = latestProductsResponse.latest
                    self?.items[1] = flashSaleResponse.flashSale
                    self?.items[2] = latestProductsResponse.latest + flashSaleResponse.flashSale
                }
            }
            .store(in: &cancellableSet)
    }
    
    func showDetailView() {
        let detailViewModel = DetailViewModel(coordinator: detailCoordinator, networkManager: networkManager)
        let detailView = DetailView(viewModel: detailViewModel).environmentObject(navigationManager)
        navigationManager.navigateTo(view: AnyView(detailView))
    }
}

