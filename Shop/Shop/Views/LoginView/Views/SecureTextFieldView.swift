import SwiftUI

enum Field: Hashable {
    
    case showPasswordField
    case hidePasswordField
}

struct SecuredTextFieldView: View {
    
    enum Opacity: Double {
        
        case hide = 0.0
        case show = 1.0
        
        mutating func toggle() {
            switch self {
                case .hide:
                    self = .show
                case .show:
                    self = .hide
            }
        }
    }
    
    @FocusState private var focusedField: Field?
    @State private var isSecured: Bool = true
    @State private var hidePasswordFieldOpacity = Opacity.show
    @State private var showPasswordFieldOpacity = Opacity.hide
    @Binding var text: String
    @State var parent: SecuredTextFieldParentProtocol
    
    var body: some View {
        VStack {
            ZStack(alignment: .trailing) {
                securedTextField
                Button(action: {
                    performToggle()
                }, label: {
                    Image(systemName: self.isSecured ? "eye.slash" : "eye")
                        .resizable()
                        .scaledToFit()
                        .accentColor(.gray)
                        .frame(height: 13.0, alignment: Alignment.trailing)
                        .contentShape(Rectangle())
                }).padding(.trailing, 10)
            }
            .onAppear {
                self.parent.hideKeyboard = hideKeyboard
            }
        }
    }
    
    var securedTextField: some View {
        Group {
            SecureField("Password", text: $text)
                .modifier(SecureTextFieldInputDataModifier())
                .focused($focusedField, equals: .hidePasswordField)
                .opacity(hidePasswordFieldOpacity.rawValue)
            
            TextField("Password", text: $text)
                .modifier(SecureTextFieldInputDataModifier())
                .focused($focusedField, equals: .showPasswordField)
                .opacity(showPasswordFieldOpacity.rawValue)
        }
    }
    
    func hideKeyboard() {
        self.focusedField = nil
    }
    
    private func performToggle() {
        isSecured.toggle()
        
        if isSecured {
            focusedField = .hidePasswordField
        } else {
            focusedField = .showPasswordField
        }
        
        hidePasswordFieldOpacity.toggle()
        showPasswordFieldOpacity.toggle()
    }
}
