import SwiftUI

struct LoginView: View, SecuredTextFieldParentProtocol {
    @EnvironmentObject var appCoordinator: AppCoordinator

    @ObservedObject var viewModel: LoginViewModel
    
    @State var hideKeyboard: (() -> Void)?
    @State private var showingAlert = false
    
    var body: some View {
        VStack(spacing: 70) {
            Spacer()
            Text("Welcome back")
                .customFont(size: 26, weight: .semibold)
            VStack(spacing: 35) {
                CustomTextField(title: "First name", text: $viewModel.firstName, prompt: viewModel.firstNamePrompt)
                SecuredTextFieldView(text: $viewModel.password, parent: self)
            }.padding(.leading, 43)
                .padding(.trailing, 43)
            
            VStack {
                Button {
                    performHideKeyboard()
                    viewModel.login()
                } label: {
                    Text("Login")
                }.buttonStyle(PrimaryButtonStyle())
                    .alert(isPresented: $viewModel.showErrorAlert) {
                        if viewModel.firstName.isEmpty || viewModel.password.isEmpty {
                            return Alert(title: Text("Error"),
                                         message: Text("Please enter your first name and password"),
                                         dismissButton: .default(Text("OK")))
                        } else {
                            return Alert(title: Text("Error"),
                                         message: Text("The username or password you entered is incorrect"),
                                         dismissButton: .default(Text("OK")))
                        }
                    }
                    .padding(.top, 30)
                Spacer()
            }
            .padding(.leading, 43)
            .padding(.trailing, 43)
        }
    }
    
    private func performHideKeyboard() {
        guard let hideKeyboard = self.hideKeyboard else {
            return
        }
        hideKeyboard()
    }
}
