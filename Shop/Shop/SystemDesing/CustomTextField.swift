import SwiftUI

struct CustomTextField: View {

    private var title: String
    private var text: Binding<String>
    private var prompt: String?
    private var isSecure: Bool

    init(title: String, text: Binding<String>, prompt: String? = nil, isSecure: Bool = false) {
        self.title = title
        self.text = text
        self.prompt = prompt
        self.isSecure = isSecure
    }

    var body: some View {
            if isSecure {
                //
            } else  {
                TextField(title, text: text)
                    .textFieldInputData()
            }

            if let prompt = prompt {
                Text(prompt)
                    .foregroundColor(.red)
                    .font(.caption)
                    .padding(.horizontal)
            }
    }
}
