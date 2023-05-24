//
//  SignUpView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 24.05.2023.
//

import SwiftUI

struct SignUpView: View {
    var body: some View {
      VStack {
        ZStack {
           Image("curvedFrame")
            .resizable()
            .scaledToFit()
          VStack {
            logoContainer
            Image("starterImage")
          }
        }
        textContainer
        Spacer()
        buttonContainer
        Spacer()
      }
      .ignoresSafeArea(edges: .top)
    }
}

extension SignUpView {
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
        .font(.system(size: 30, weight: .bold))
      
      Text("Thousand of people are usign silent moon for smalls meditation ")
        .foregroundColor(.gray)
        .multilineTextAlignment(.center)
        .padding(.horizontal, 50)
    }
  }
  
  private var buttonContainer: some View {
    VStack(spacing: 20) {
      Button(action: {}) {
        Text("SIGN UP")
          .font(.system(size: 14, weight: .medium))
          .foregroundColor(.white)
          .frame(maxWidth: .infinity)
          .frame(maxHeight: 63)
          .background(Colors.primaryPurple)
          .cornerRadius(38)
          .padding(.horizontal, 20)
      }
      HStack {
        Text("ALREADY HAVE AN ACCOUNT?")
          .font(.system(size: 14, weight: .medium))
          .foregroundColor(.gray)
        Button(action: {}) {
          Text("LOG IN")
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(.blue)
        }
      }
    }
  }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
      SignUpView()
    }
}
