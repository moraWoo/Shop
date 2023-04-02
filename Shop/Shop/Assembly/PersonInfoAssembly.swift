import SwiftUI

class PersonInfoAssembly {
    
    let dependencies: AppDependencies
    let personInfoCoordinator: PersonInfoCoordinator

    init(dependencies: AppDependencies, personInfoCoordinator: PersonInfoCoordinator) {
        self.dependencies = dependencies
        self.personInfoCoordinator = personInfoCoordinator
    }
    
    func assemble() -> some View {
        guard let appCoordinator = personInfoCoordinator.parentCoordinator as? AppCoordinator else {
            print("Error: personInfoCoordinator.parentCoordinator is not an instance of the AppCoordinator class.")
            return AnyView(EmptyView())
        }
        let viewModel = PersonInfoViewModel(appCoordinator: appCoordinator, personInfoCoordinator: personInfoCoordinator)
        
        let view = PersonInfoView(viewModel: viewModel)
        return AnyView(view)
    }
}
