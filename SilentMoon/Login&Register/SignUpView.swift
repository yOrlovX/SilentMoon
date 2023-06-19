//
//  SignUpView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 25.05.2023.
//

import SwiftUI

struct SignUpView: View {
  @State private var name: String = ""
  @State private var email: String = ""
  @State private var password: String = ""
  
  var body: some View {
    VStack(spacing: SignUpViewAdaptiveSpacing.spacing) {
      Text("Create your account")
        .font(.custom(HelveticaNeue.bold, size: 28))
      
      buttonsContainer
      
      Text("OR LOG IN WITH EMAIL")
        .font(.custom(HelveticaNeue.bold, size: 14))
        .foregroundColor(Colors.grayText)
      
      textFieldsContainer
      
      loginButtonContainer
    }
    .navigationBarHidden(true)
  }
}

extension SignUpView {
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
      TextField("Name", text: $name)
        .modifier(TextFieldModifier())
      
      TextField("Email adress", text: $email)
        .modifier(TextFieldModifier())
      
      TextField("Password", text: $email)
        .modifier(TextFieldModifier())
    }
  }
  
  private var loginButtonContainer: some View {
    VStack(spacing: 32) {
      HStack {
        Spacer()
        Text("I have read the")
          .foregroundColor(Colors.grayText)
          .font(.custom(HelveticaNeue.medium, size: 14))
        
        Text("Privace Policy")
          .foregroundColor(.blue)
          .font(.custom(HelveticaNeue.medium, size: 14))
        Spacer()
        Spacer()
        Spacer()
        Spacer()
        Spacer()
        Image(systemName: "square")
          .resizable()
          .renderingMode(.template)
          .foregroundColor(Colors.grayText)
          .scaledToFit()
          .frame(width: 25, height: 25)
        Spacer()
      }
      NavigationLink(destination: RemindersView()) {
        Text("GET STARTED")
          .modifier(PrimaryButtonModifier())
      }
    }
  }
}

struct SignUpView_Previews: PreviewProvider {
  static var previews: some View {
    SignUpView()
  }
}
