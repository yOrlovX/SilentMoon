//
//  ImageExtension.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 06.06.2023.
//

import SwiftUI

extension Image {
  func playerButtonModifier() -> some View {
    self
      .renderingMode(.template)
      .resizable()
      .foregroundColor(Colors.grayText)
      .scaledToFit()
      .frame(width: 40, height: 40)
  }
  
  func playPauseButtonModifier() -> some View {
    self
      .renderingMode(.template)
      .resizable()
      .foregroundColor(Colors.grayText)
      .scaledToFit()
      .frame(width: 25, height: 25)
      .overlay {
        Circle()
          .stroke(.gray.opacity(0.6), lineWidth: 1)
          .frame(width: 80, height: 80)
      }
  }
}
