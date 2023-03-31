import SwiftUI
import Combine

class MainViewModel: ObservableObject {
    
    @Published var isDetailViewShowing: Bool = false
    
    @Published var profileImage: UIImage?
    @Published var firstName: String?
    @Published var items: [[Any]] = [[], [], []]
    @Published var showDetailView: Binding<Bool>?
    @Published var showPersonInfoView: Binding<Bool>?

    let coordinator: MainCoordinator
    let navigationManager: NavigationManager
    let networkManager: NetworkManager
    let userRepository: UserRepository
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(
        coordinator: MainCoordinator,
        userRepository: UserRepository,
        networkManager: NetworkManager,
        navigationManager: NavigationManager
    ) {
        self.coordinator = coordinator
        self.userRepository = userRepository
        self.networkManager = networkManager
        self.navigationManager = navigationManager
        
        if let currentUser = userRepository.currentUser,
           let avatarData = currentUser.avatar {
            profileImage = UIImage(data: avatarData)
        }
        
        fetchLoggedInUser()
        fetchLatestAndFlashSaleProducts()
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
    
    func personInfo() {
        goToPersonInfoView()
    }
    
    func goToPersonInfoView() {
        
//        let personInfoViewModel = PersonInfoViewModel(coordinator: personInfoCoordinator, loginCoordinator: loginCoordinator, userRepository: userRepository, navigationManager: navigationManager)
//        let personInfoView = PersonInfoView(viewModel: personInfoViewModel, navigationManager: navigationManager).environmentObject(navigationManager)
//        navigationManager.navigateTo(view: AnyView(personInfoView))
        
    }
    
    func presentDetailView() {
        
//        let detailViewModel = DetailViewModel(coordinator: detailCoordinator, networkManager: networkManager, navigationManager: navigationManager)
//        let detailView = DetailView(viewModel: detailViewModel, navigationManager: navigationManager).environmentObject(navigationManager)
//        navigationManager.navigateTo(view: AnyView(detailView))
    }
}
