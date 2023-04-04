import Combine
import SwiftUI

enum AlertType: Identifiable {
  case fieldsEmpty, userExists

  var id: Int {
    switch self {
    case .fieldsEmpty: return 1
    case .userExists: return 2
    }
  }
}

struct SignUpView: View {
  @ObservedObject var viewModel: SignUpViewModel

  @State private var showingAlertTextFieldsIsEmpty = false
  @State private var showPasswordInput = false
  @State private var activeAlert: AlertType?

  var body: some View {
    VStack(spacing: 70) {
      Text("Sign in")
        .customFont(size: 26, weight: .semibold)
      VStack(spacing: 15) {
        VStack(spacing: 35) {
          CustomTextField(
            title: "First name",
            text: $viewModel.firstName,
            prompt: viewModel.firstNamePrompt
          )
          CustomTextField(
            title: "Last name",
            text: $viewModel.lastName,
            prompt: viewModel.lastNamePrompt
          )
          CustomTextField(
            title: "Email",
            text: $viewModel.email,
            prompt: viewModel.emailPrompt
          )

          Button {
            if viewModel.firstName.isEmpty || viewModel.lastName.isEmpty || viewModel.email.isEmpty {
              activeAlert = .fieldsEmpty
            } else {
              let cancellable = viewModel.checkExistingUser()
                .sink { userExists in
                  if userExists {
                    activeAlert = .some(.userExists)
                  } else {
                    showPasswordInput = true
                  }
                }
              viewModel.cancellableSet.insert(cancellable)
            }
          } label: {
            Text("Sign in")
          }
          .buttonStyle(PrimaryButtonStyle())
        }

        HStack {
          Text("Already have an account?")
            .customFont(size: 10, weight: .medium)
            .foregroundColor(Color(red: 128 / 255, green: 128 / 255, blue: 128 / 255))
          Button {
            viewModel.login()
          } label: {
            Text("Log in")
              .customFont(size: 10, weight: .medium)
          }
          Spacer()
        }
      }

      VStack(spacing: 38) {
        Button {
          viewModel.login()
        } label: {
          Image("googleLogo")
          Text("Sign in with Google")
            .customFont(size: 12, weight: .medium)
            .foregroundColor(.black)
        }
        Button {
          viewModel.login()
        } label: {
          Image("appleLogo")
          Text("Sign in with Apple")
            .customFont(size: 12, weight: .medium)
            .foregroundColor(.black)
        }
      }
    }
    .padding(.leading, 43)
    .padding(.trailing, 43)
    .sheet(isPresented: $showPasswordInput) {
      VStack {
        Text("Enter your password")
          .font(.headline)
          .padding(.bottom, 20)
        SecureField("Password", text: $viewModel.password)
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .padding(.bottom, 20)
        Button("Submit") {
          viewModel.createUser()
        }
        .buttonStyle(PrimaryButtonStyle())
      }.padding(.leading, 43)
      .padding(.trailing, 43)
      .frame(width: 300, height: 300)
    }
    .alert(item: $activeAlert) { alertType in
      switch alertType {
      case .fieldsEmpty:
        return Alert(
          title: Text("Fields are not filled"),
          message: Text("Please fill in all the fields."),
          dismissButton: .default(Text("OK"))
        )
      case .userExists:
        return Alert(
          title: Text("User exists"),
          message: Text("A user with this email already exists."),
          dismissButton: .default(Text("OK"))
        )
      }
    }
  }
}
