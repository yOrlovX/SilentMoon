//
//  HomeView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 26.05.2023.
//

import SwiftUI
import AVFoundation

struct MainView: View {
  
  let player = AVAudioPlayer()
  @State var selectedTab: Tab = .home
  
  init() {
    UITabBar.appearance().isHidden = true
  }
  
    var body: some View {
      ZStack {
        
        VStack {
          VStack {
            TabView(selection: $selectedTab) {
              Text("Home")
                .tag(Tab.home)
              Text("Sleep")
                .tag(Tab.sleep)
              Text("Meditate")
                .tag(Tab.meditateTab)
              MusicPlayer(player: player)
                .tag(Tab.music)
              Text("Profile")
                .tag(Tab.profile)
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

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
      MainView()
    }
}
