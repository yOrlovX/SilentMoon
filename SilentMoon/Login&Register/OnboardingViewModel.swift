//
//  OnboardingViewModel.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 19.06.2023.
//

import Foundation

final class OnboardingViewModel: ObservableObject {
  @Published var state: OnboardingState = .welcome
  
}

enum OnboardingState {
  case welcome
  case starter
  case singIn
  case singUp
  case reminders
  case topics
  case main
}


