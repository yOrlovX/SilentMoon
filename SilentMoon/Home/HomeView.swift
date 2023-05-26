//
//  HomeView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 26.05.2023.
//

import SwiftUI

struct HomeView: View {
  @State var selectedTab: Tab = .home
  
  init() {
    UITabBar.appearance().isHidden = true
  }
  
    var body: some View {
      ZStack {
        
        VStack {
          TabView(selection: $selectedTab) {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
              HStack {
                Text(tab.rawValue)
              }
              .tag(tab)
            }
          }
        }
        
        VStack {
          Spacer()
          CustomTabBar(selectedTab: $selectedTab)
        }
      }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
