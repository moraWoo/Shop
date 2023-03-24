import SwiftUI
import Combine

class MainViewModel: ObservableObject {
    @Published var profileImage: UIImage?
    @Published var firstName: String?
    @Published var mainViewItems: [[Any]] = []

    var coordinator: MainCoordinator
    var personInfoCoordinator: PersonInfoCoordinator
    private let userRepository: UserRepository
    private let networkManager: NetworkManager
    private var cancellableSet: Set<AnyCancellable> = []
    
    init(
        coordinator: MainCoordinator,
        personInfoCoordinator: PersonInfoCoordinator,
        userRepository: UserRepository,
        networkManager: NetworkManager
    ) {
        self.coordinator = coordinator
        self.personInfoCoordinator = personInfoCoordinator
        self.userRepository = userRepository
        self.networkManager = networkManager
        
        fetchLoggedInUser()
        if let currentUser = userRepository.currentUser,
           let avatarData = currentUser.avatar {
            profileImage = UIImage(data: avatarData)
        }
        
        fetchLatestAndFlashSaleProducts()
    }
    
    func goToMainView() {
        coordinator.goToMainView()
        print("After goToMainView()")
        coordinator.parentCoordinator?.addChildCoordinator(coordinator)
    }
    
    func personInfo() {
        goToPersonInfoView()
        print("personInfo \(String(describing: userRepository.currentUser))")
    }
    
    func goToPersonInfoView() {
        guard let parentCoordinator = coordinator.parentCoordinator as? AppCoordinator else {
            print("Parent coordinator is nil")
            return
        }
        print("Parent coordinator type:", type(of: parentCoordinator))
        print("Child coordinators:", parentCoordinator.childCoordinators)
        
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
            } receiveValue: { [weak self] latestProductsResponse, flashSaleResponse in
                DispatchQueue.main.async {
                    self?.mainViewItems[0] = latestProductsResponse.latest
                    self?.mainViewItems[1] = flashSaleResponse.flashSale
                }
            }
            .store(in: &cancellableSet)
    }
}

