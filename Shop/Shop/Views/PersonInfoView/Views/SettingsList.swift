import SwiftUI

struct SettingsList: View {
    
    @ObservedObject var viewModel: PersonInfoViewModel

    let labels = [
        "Trade store", "Payment method", "Balance", "Trade history", "Restore Purchase", "Help", "Log out"
    ]
    let pics = [
        "creditCardS", "restorePurchaseS", "helpS", "logOutS"
    ]
    
    var uniquePics: [String] {
        var unique = Array(repeating: pics[0], count: 4)
        unique.append(contentsOf: pics[1...])
        return unique
    }
    
    func createRow(label: String, pic: String, showChevron: Bool) -> some View {
        HStack {
            let circle = Circle()
                .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                .frame(height: 40)
            
            let image = Image(pic)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
                .frame(width: 20, height: 20)
                .clipShape(Rectangle())
            
            circle.overlay(image)
            
            VStack(alignment: .leading) {
                Text(label)
                    .customFont(size: 14, weight: .medium)
                    .foregroundColor(.black)
            }
            
            Spacer()
            if showChevron {
                Image(systemName: "chevron.right")
                    .foregroundColor(.black)
            }
        }
    }
    
    @ViewBuilder
    func settingsRow(label: String, pic: String) -> some View {
        if label == "Balance" {
            //
        } else if label == "Help" {
            Button(action: {
                //
            }) {
                createRow(label: label, pic: pic, showChevron: false)
            }
        } else if label == "Log out" {
            Button(action: {
                viewModel.logout()
            }) {
                createRow(label: label, pic: pic, showChevron: false)
            }
        } else {
            NavigationLink(destination: Text("Destination: \(label)")) {
                createRow(label: label, pic: pic, showChevron: true)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                TopView(
                    viewModel: viewModel,
                    profileImage: $viewModel.profileImage
                )

                VStack(alignment: .leading) {
                    ForEach(Array(zip(labels, uniquePics)), id: \.0) { label, pic in
                        settingsRow(label: label, pic: pic)
                            .padding(.vertical, 5)
                    }
                }
                .padding(.leading, 32)
                .padding(.trailing, 32)
            }
            .background(Color.white)
        }
        .accentColor(.black)
    }
}
