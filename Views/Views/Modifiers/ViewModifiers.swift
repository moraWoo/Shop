//
//  ViewModifiers.swift
//  Views
//
//  Created by Ильдар on 17.03.2023.
//

import SwiftUI

struct TextFieldInputDataModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(8)
            .multilineTextAlignment(.center)
            .background(RoundedRectangle(cornerRadius: 15).fill(Color(red: 232/255, green: 232/255, blue: 232/255)))
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
                .fill(Color(red: 232/255, green: 232/255, blue: 232/255)))
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
            .background(Color(red: 78/255, green: 85/255, blue: 215/255))
            .foregroundColor(.white)
            .cornerRadius(15)
            .font(.custom("Montserrat-Regular", size: 14))
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
        var path = Path()

        path.move(to: CGPoint(x: 0, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: cornerRadius))
        path.addArc(center: CGPoint(x: cornerRadius, y: cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 90), clockwise: false)
        path.addLine(to: CGPoint(x: rect.width - cornerRadius, y: 0))
        path.addArc(center: CGPoint(x: rect.width - cornerRadius, y: cornerRadius), radius: cornerRadius, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 0), clockwise: false)
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))

        return path
    }
}

extension VerticalAlignment {
    private enum BottomTextAlignment: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.bottom]
        }
    }

    static let bottomText = Self(BottomTextAlignment.self)
}
