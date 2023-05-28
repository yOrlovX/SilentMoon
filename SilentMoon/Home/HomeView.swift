//
//  HomeView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 27.05.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
      VStack {
        logoContainer
        VStack(alignment: .leading) {
          Text("Good Morning, Afsar")
            .font(.custom(HelveticaNeue.bold, size: 28))
          Text("We Wish you have a good day")
            .font(.custom(HelveticaNeue.light, size: 20))
            .foregroundColor(Colors.grayText)
        }
      }
    }
}

extension HomeView {
  private var logoContainer: some View {
    HStack(spacing: 10) {
      Text("Silent")
        .font(.system(size: 16, weight: .bold))
      Image("logo")
      Text("Moon")
        .font(.system(size: 16, weight: .bold))
    }
  }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}
