import SwiftUI

struct CircleButtonView: View {
    
    let tags = [
        "Phones", "Headphonnes", "Games", "Cars", "Furniture", "Kids"
    ]
    
    let pics = [
        "phones", "headphones", "games", "cars", "furniture", "kids"
    ]
    
    var body: some View {
        GeometryReader { geometry in
            let buttonWidth = (geometry.size.width - CGFloat(tags.count - 1) * 21) / CGFloat(tags.count)
            let imageWidth = buttonWidth * 0.5
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 12) {
                    ForEach(Array(zip(tags, pics)), id: \.0) { tag, pic in
                        VStack {
                            Button(action: {}) {
                                let circle = Circle()
                                    .fill(Color(red: 238/255, green: 239/255, blue: 244/255))
                                    .frame(width: buttonWidth, height: buttonWidth)
                                
                                let image = Image(pic)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .scaledToFit()
                                    .frame(width: imageWidth, height: imageWidth)
                                    .clipShape(Circle())
                                
                                circle.overlay(image)
                            }
                            Text(tag)
                                .customFont(size: 8, weight: .medium)
                                .foregroundColor(Color(red: 166/255, green: 167/255, blue: 171/255))
                        }
                    }
                }
                .padding(.top, 16)
                .padding(.leading, 17)
                .padding(.trailing, 17)
            }
        }
        .frame(height: 100)
    }
}
