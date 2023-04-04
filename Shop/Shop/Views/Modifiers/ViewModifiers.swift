import SwiftUI

struct TextFieldInputDataModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(8)
      .multilineTextAlignment(.center)
      .background(RoundedRectangle(cornerRadius: 15).fill(Color(red: 232 / 255, green: 232 / 255, blue: 232 / 255)))
      .overlay(
        RoundedRectangle(cornerRadius: 5)
          .stroke(lineWidth: 0)
      )
      .font(.custom("Montserrat-Regular", size: 11))
      .fontWeight(.medium)
      .textInputAutocapitalization(.never)
      .keyboardType(.asciiCapable)
      .autocorrectionDisabled(true)
  }
}

struct SecureTextFieldInputDataModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .textInputAutocapitalization(.never)
      .keyboardType(.asciiCapable)
      .autocorrectionDisabled(true)
      .padding(8)
      .multilineTextAlignment(.center)
      .background(RoundedRectangle(cornerRadius: 15)
      .fill(Color(red: 232 / 255, green: 232 / 255, blue: 232 / 255)))
      .overlay(
        RoundedRectangle(cornerRadius: 5)
          .stroke(lineWidth: 0)
      )
      .font(.custom("Montserrat-Regular", size: 11))
      .fontWeight(.medium)
  }
}

struct PrimaryButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding()
      .frame(maxWidth: .infinity)
      .background(Color(red: 78 / 255, green: 85 / 255, blue: 215 / 255))
      .foregroundColor(.white)
      .cornerRadius(15)
      .font(.custom("Montserrat-Regular", size: 14))
      .fontWeight(.bold)
      .scaleEffect(configuration.isPressed ? 1.2 : 1)
      .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
  }
}

struct MiniButtonStyle: ButtonStyle {
  let width: CGFloat
  let height: CGFloat

  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding()
      .frame(width: width, height: height)
      .background(Color(red: 78 / 255, green: 85 / 255, blue: 215 / 255))
      .foregroundColor(.white)
      .cornerRadius(8)
      .font(.custom("Montserrat-Regular", size: 8))
      .fontWeight(.bold)
      .scaleEffect(configuration.isPressed ? 1.2 : 1)
      .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
  }
}

struct AppleGoogleButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .foregroundColor(.black)
      .font(.custom("Montserrat-Regular", size: 12))
      .fontWeight(.medium)
  }
}

extension Text {
  func customFont(size: CGFloat, weight: Font.Weight) -> Text {
    self.font(.custom("Montserrat-Regular", size: size))
      .fontWeight(weight)
  }
}

extension TextField {
  func textFieldInputData() -> some View {
    modifier(TextFieldInputDataModifier())
  }
}

extension SecureField {
  func textFieldInputData() -> some View {
    modifier(TextFieldInputDataModifier())
  }
}

struct TopRoundedRectangle: Shape {
  var cornerRadius: CGFloat

  func path(in rect: CGRect) -> Path {
    // Вычисляем координаты верхних левой и правой точек
    let topLeft = CGPoint(x: rect.minX, y: rect.minY + cornerRadius)
    let topRight = CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius)
    // Вычисляем координаты нижних правой и левой точек
    let bottomRight = CGPoint(x: rect.maxX, y: rect.maxY)
    let bottomLeft = CGPoint(x: rect.minX, y: rect.maxY)

    var path = Path()
    // Начинаем с левой верхней точки и добавляем дугу влево-вверх
    path.move(to: topLeft)
    path.addArc(
      center: CGPoint(
        x: topLeft.x + cornerRadius,
        y: topLeft.y
      ),
      radius: cornerRadius,
      startAngle: Angle(degrees: 180),
      endAngle: Angle(degrees: 270),
      clockwise: false
    )
    // Добавляем линию до верхней правой точки
    path.addLine(to: CGPoint(x: topRight.x, y: rect.minY))
    // Добавляем дугу вправо-вверх
    path.addArc(
      center: CGPoint(
        x: topRight.x,
        y: topRight.y
      ),
      radius: cornerRadius,
      startAngle: Angle(degrees: -90),
      endAngle: Angle(degrees: 0),
      clockwise: false
    )
    // Добавляем линию до правой нижней точки
    path.addLine(to: bottomRight)
    // Добавляем линию до левой нижней точки
    path.addLine(to: bottomLeft)
    // Добавляем линию до левой верхней точки
    path.addLine(to: topLeft)
    // Завершаем путь
    path.closeSubpath()

    return path
  }
}

struct RoundedCornersShape: Shape {
  var corners: UIRectCorner
  var radius: CGFloat

  func path(in rect: CGRect) -> Path {
    let path = UIBezierPath(
      roundedRect: rect,
      byRoundingCorners: corners,
      cornerRadii: CGSize(width: radius, height: radius))
    return Path(path.cgPath)
  }
}

extension VerticalAlignment {
  private enum BottomTextAlignment: AlignmentID {
    static func defaultValue(in dim: ViewDimensions) -> CGFloat {
      dim[.bottom]
    }
  }

  static let bottomText = Self(BottomTextAlignment.self)
}
