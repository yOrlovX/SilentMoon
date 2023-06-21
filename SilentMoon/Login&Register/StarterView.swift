//
//  SignUpView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 24.05.2023.
//

import SwiftUI

struct StarterView: View {
  @EnvironmentObject var onboardingViewModel: OnboardingViewModel
  
  var body: some View {
    VStack {
      ZStack {
        Image("curvedFrame")
          .resizable()
          .frame(maxHeight: UIScreen.main.bounds.height / 2)
          .frame(width: UIScreen.main.bounds.width)
          .overlay {
            VStack {
              logoContainer
              Image("starterImage")
                .resizable()
                .frame(maxWidth: UIScreen.main.bounds.width - 80)
                .frame(maxHeight: 240)
            }
          }
        
      }
      Spacer()
      textContainer
      Spacer()
      buttonContainer
      Spacer()
    }
    .ignoresSafeArea(edges: .top)
    .navigationBarHidden(true)
  }
}

extension StarterView {
  private var logoContainer: some View {
    HStack(spacing: 10) {
      Text("Silent")
        .font(.system(size: 16, weight: .bold))
      Image("logo")
      Text("Moon")
        .font(.system(size: 16, weight: .bold))
    }
  }
  
  private var textContainer: some View {
    VStack(spacing: 15) {
      Text("We are what we do")
        .font(.custom(HelveticaNeue.bold, size: 30))
      
      Text("Thousand of people are usign silent moon for smalls meditation ")
        .lineSpacing(10)
        .font(.custom(HelveticaNeue.light, size: 16))
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
        .padding(.horizontal, 50)
    }
  }
  
  private var buttonContainer: some View {
    VStack(spacing: 20) {
      Button(action: { onboardingViewModel.state = .singUp }) {
        Text("SIGN UP")
          .modifier(PrimaryButtonModifier())
      }
      HStack {
        Text("ALREADY HAVE AN ACCOUNT?")
          .font(.custom(HelveticaNeue.medium, size: 14))
          .foregroundColor(.gray)
        Button(action: { onboardingViewModel.state = .singIn }) {
          Text("LOG IN")
            .font(.custom(HelveticaNeue.medium, size: 14))
            .foregroundColor(.blue)
        }
      }
    }
  }
}

struct StarterView_Previews: PreviewProvider {
  static var previews: some View {
    StarterView()
  }
}
