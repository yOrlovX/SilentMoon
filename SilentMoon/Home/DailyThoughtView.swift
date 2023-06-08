//
//  DailyThoughtCell.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 08.06.2023.
//

import SwiftUI

struct DailyThoughtView: View {
  var body: some View {
    ZStack {
      HStack {
        Spacer()
        VStack(alignment: .leading, spacing: 10) {
          Text("Daily Thought")
            .font(.custom(HelveticaNeue.bold, size: 18))
            .foregroundColor(.white)
          
          HStack(spacing: 5) {
            Text("MEDITATION")
              .font(.custom(HelveticaNeue.medium, size: 11))
              .foregroundColor(.white)
            
            Text("3-10 min")
              .font(.custom(HelveticaNeue.medium, size: 11))
              .foregroundColor(.white)
          }
        }
        Spacer()
        Image(systemName: "play.fill")
          .padding(10)
          .background(.white)
          .cornerRadius(25)
        Spacer()
      }
    }
    .frame(width: UIScreen.main.bounds.width - 40, height: 95)
    .background(.purple)
    .cornerRadius(15)
  }
}

struct DailyThoughtView_Previews: PreviewProvider {
  static var previews: some View {
    DailyThoughtView()
  }
}
