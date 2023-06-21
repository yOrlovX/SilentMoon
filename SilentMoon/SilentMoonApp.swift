//
//  SilentMoonApp.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 24.05.2023.
//

import SwiftUI

@main
struct SilentMoonApp: App {
  let onboardingViewModel = OnboardingViewModel.init()
  
    var body: some Scene {
        WindowGroup {
          OnboardingView()
        }
    }
}
