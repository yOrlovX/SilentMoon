//
//  WelcomeView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 25.05.2023.
//

import SwiftUI

struct WelcomeView: View {
  var body: some View {
    NavigationView {
      ZStack {
        Colors.purpleBg
          .ignoresSafeArea()
        VStack(spacing: 40) {
          logoContainer
          Spacer()
          textContainer
          Spacer()
          Image("meditate")
            .resizable()
            .scaledToFit()
          NavigationLink(destination: StarterView()) {
            Text("GET STARTED")
          }
          .modifier(GrayButtonModifier())
          Spacer()
        }
      }
      .background(.ultraThinMaterial)
      .navigationBarHidden(true)
    }
  }
}

extension WelcomeView {
  private var logoContainer: some View {
    HStack(spacing: 10) {
      Text("Silent")
        .font(.system(size: 16, weight: .bold))
      Image("logo")
      Text("Moon")
        .font(.system(size: 16, weight: .bold))
    }
    .foregroundColor(.white)
  }
  
  private var textContainer: some View {
    VStack(spacing: 10) {
      Text("Welcome")
        .font(.custom(HelveticaNeue.bold, size: 30))
        .foregroundColor(.white)
      
      Text("to Silent Moon")
        .font(.custom(HelveticaNeue.light, size: 30))
        .foregroundColor(.white)
      
      Text("Explore the app, Find some peace of mind to prepare for meditation.")
        .font(.custom(HelveticaNeue.light, size: 16))
        .foregroundColor(.white)
        .multilineTextAlignment(.center)
        .padding(.horizontal, 40)
    }
  }
}

struct WelcomeView_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeView()
  }
}
