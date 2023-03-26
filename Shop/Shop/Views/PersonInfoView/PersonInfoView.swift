import SwiftUI

struct PersonInfoView: View {
    @EnvironmentObject var appCoordinator: AppCoordinator
    @ObservedObject var viewModel: PersonInfoViewModel
    
    var body: some View {
        VStack() {
            SettingsList(viewModel: viewModel)
        }
        .navigationBarTitle("Profile", displayMode: .inline)
    }
}
