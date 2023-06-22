//
//  OnboardingView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 19.06.2023.
//

import SwiftUI

struct OnboardingView: View {
  
  @StateObject var viewModel = OnboardingViewModel()
  
  var body: some View {
    NavigationView {
      ZStack {
        switch viewModel.state {
        case .welcome:
          WelcomeView()
        case .starter:
          StarterView()
        case .singIn:
          SignInView()
        case .singUp:
          SignUpView()
        case .reminders:
          RemindersView()
        case .topics:
          ChooseTopicView()
        case .main:
          MainView()
        }
      }
      .navigationBarHidden(true)
      .environmentObject(viewModel)
    }
  }
}
