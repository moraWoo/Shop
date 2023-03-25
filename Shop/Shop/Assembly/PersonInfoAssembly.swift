import SwiftUI

class PersonInfoAssembly {
    
    let dependencies: AppDependencies
    
    init(dependencies: AppDependencies) {
        self.dependencies = dependencies
    }
    
    func assemble(userRepository: UserRepository) -> some View {
        
        guard let personInfoCoordinator = dependencies.personInfoCoordinator,
              let loginCoordinator = dependencies.loginCoordinator else {
            fatalError("PersonInfoCoordinator or LoginCoordinator is missing")
        }
        
        let viewModel = PersonInfoViewModel(
            coordinator: personInfoCoordinator,
            loginCoordinator: loginCoordinator,
            userRepository: dependencies.userRepository
        )
        let view = PersonInfoView(viewModel: viewModel)
        personInfoCoordinator.view = AnyView(view)

        return AnyView(view)
    }
}
