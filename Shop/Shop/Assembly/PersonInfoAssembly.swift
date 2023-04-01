import SwiftUI

class PersonInfoAssembly {
    
    let dependencies: AppDependencies
    let personInfoCoordinator: PersonInfoCoordinator

    init(dependencies: AppDependencies, personInfoCoordinator: PersonInfoCoordinator) {
        self.dependencies = dependencies
        self.personInfoCoordinator = personInfoCoordinator
    }
    
    func assemble() -> some View {
        let viewModel = PersonInfoViewModel(appCoordinator: personInfoCoordinator.parentCoordinator as! AppCoordinator, personInfoCoordinator: personInfoCoordinator)
        let view = PersonInfoView(viewModel: viewModel)
        return AnyView(view)
    }
}
