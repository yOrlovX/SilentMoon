//
//  SignInView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 25.05.2023.
//

import SwiftUI

struct SignInView: View {
  @EnvironmentObject var onboardingViewModel: OnboardingViewModel
  
  @State private var email: String = ""
  @State private var password: String = ""
  
  var body: some View {
    VStack(spacing: 25) {
      Text("Welcome Back!")
        .font(.custom(HelveticaNeue.bold, size: 28))
      
      buttonsContainer
      
      Text("OR LOG IN WITH EMAIL")
        .font(.custom(HelveticaNeue.bold, size: 14))
        .foregroundColor(Colors.grayText)
      
      textFieldsContainer
      
      loginButtonContainer
      
      dontHaveAccountContainer
    }    
    .frame(maxHeight: UIScreen.main.bounds.height - 80)
  }
}

extension SignInView {
  private var buttonsContainer: some View {
    VStack(spacing: 20) {
      Button(action: {}) {
        HStack {
          Image("fb")
            .padding(.leading, 40)
          Spacer()
          Text("CONTINUE WITH FACEBOOK")
          Spacer()
          Spacer()
        }
      }
      .modifier(FacebookButtonModifier())
      
      Button(action: {}) {
        HStack {
          Image("google")
            .padding(.leading, 40)
          Spacer()
          Text("CONTINUE WITH GOOGLE")
          Spacer()
          Spacer()
        }
      }
      .modifier(GoogleButtonModifier())
    }
  }
  
  private var textFieldsContainer: some View {
    VStack(spacing: 20) {
      TextField("Email adress", text: $email)
        .modifier(TextFieldModifier())
      
      TextField("Password", text: $email)
        .modifier(TextFieldModifier())
    }
  }
  
  private var loginButtonContainer: some View {
    VStack(spacing: 20) {
      Button(action: { onboardingViewModel.state = .main }) {
        Text("LOG IN")
          .modifier(PrimaryButtonModifier())
      }
      Text("Forgot Password?")
        .font(.custom(HelveticaNeue.medium, size: 14))
    }
  }
  
  private var dontHaveAccountContainer: some View {
    HStack {
      Text("DONT HAVE AN ACCOUNT?")
        .font(.custom(HelveticaNeue.medium, size: 14))
        .foregroundColor(.gray)
      Button(action: { onboardingViewModel.state = .singUp }) {
        Text("SIGN UP")
          .font(.custom(HelveticaNeue.medium, size: 14))
          .foregroundColor(.blue)
      }
    }
  }
}

struct SignInView_Previews: PreviewProvider {
  static var previews: some View {
    SignInView()
  }
}
