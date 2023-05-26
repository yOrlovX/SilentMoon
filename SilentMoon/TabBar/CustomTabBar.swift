//
//  CustomTabBar.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 26.05.2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
  case home
  case sleep
  case meditateTab
  case music
  case profile
}

struct CustomTabBar: View {
  @Binding var selectedTab: Tab
    var body: some View {
      VStack {
        HStack {
          ForEach(Tab.allCases, id: \.rawValue) { tab in
            Spacer()
            Image(tab.rawValue)
              .renderingMode(.template)
              .foregroundColor(selectedTab == tab ? .white : .gray)
              .padding()
              .background(selectedTab == tab ? Colors.purpleBg : .white)
              .cornerRadius(18)
              .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
              .onTapGesture {
                withAnimation(.easeIn(duration: 0.1)) {
                  selectedTab = tab
                }
              }
            Spacer()
          }
        }
        .frame(width: nil, height: 80)
        .background(.thinMaterial)
      }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
      CustomTabBar(selectedTab: .constant(.home))
    }
}
