import SwiftUI

struct PersonInfoView: View {
    @ObservedObject var viewModel: PersonInfoViewModel

    var body: some View {
        VStack() {
            SettingsList()
                .environmentObject(viewModel)
        }
    }
}
