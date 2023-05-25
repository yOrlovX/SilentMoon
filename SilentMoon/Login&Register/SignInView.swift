//
//  SignInView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 25.05.2023.
//

import SwiftUI

struct SignInView: View {
  @State private var email: String = ""
  @State private var password: String = ""
  
  var body: some View {
    VStack(spacing: 35) {
      Spacer()
      Text("Create your account")
        .font(.custom(HelveticaNeue.bold, size: 28))
      
      buttonsContainer
      
      Text("OR LOG IN WITH EMAIL")
        .font(.custom(HelveticaNeue.bold, size: 14))
        .foregroundColor(Colors.grayText)
      
      textFieldsContainer
      
      loginButtonContainer
    }
    
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
            .font(.custom(HelveticaNeue.medium, size: 14))
            .foregroundColor(.white)
          Spacer()
          Spacer()
        }
      }
      .frame(maxWidth: .infinity)
      .frame(maxHeight: 63)
      .background(Colors.fbPurple)
      .cornerRadius(38)
      .padding(.horizontal, 20)
      
      Button(action: {}) {
        HStack {
          Image("google")
            .padding(.leading, 40)
          Spacer()
          Text("CONTINUE WITH GOOGLE")
            .font(.custom(HelveticaNeue.medium, size: 14))
            .foregroundColor(.black)
          Spacer()
          Spacer()
        }
      }
      .frame(maxWidth: .infinity)
      .frame(maxHeight: 63)
      .overlay(RoundedRectangle(cornerRadius: 38)
        .stroke(.gray.opacity(0.6), lineWidth: 1))
      .padding(.horizontal, 20)
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
      Button(action: {}) {
        Text("LOG IN")
          .modifier(PrimaryButtonModifier())
      }
      
      Text("Forgot Password?")
        .font(.custom(HelveticaNeue.medium, size: 14))
      Spacer()
      HStack {
        Text("ALREADY HAVE AN ACCOUNT?")
          .font(.custom(HelveticaNeue.medium, size: 14))
          .foregroundColor(.gray)
        Button(action: {}) {
          Text("SIGN IN")
            .font(.custom(HelveticaNeue.medium, size: 14))
            .foregroundColor(.blue)
        }
      }
    }
  }
}

struct SignInView_Previews: PreviewProvider {
  static var previews: some View {
    SignInView()
  }
}
