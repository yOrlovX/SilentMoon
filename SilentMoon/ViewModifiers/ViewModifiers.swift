//
//  ViewModifiers.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 25.05.2023.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .padding(.leading, 20)
      .frame(maxWidth: .infinity, maxHeight: 63)
      .background(Colors.textFieldBackground)
      .cornerRadius(15)
      .padding(.horizontal, 20)
  }
}

struct PrimaryButtonModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.custom(HelveticaNeue.medium, size: 14))
      .foregroundColor(.white)
      .frame(maxWidth: .infinity)
      .frame(maxHeight: 63)
      .background(Colors.primaryPurple)
      .cornerRadius(38)
      .padding(.horizontal, 20)
  }
}
