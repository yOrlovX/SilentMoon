//
//  ChooseTopicView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 28.05.2023.
//

import SwiftUI

struct ChooseTopicView: View {
    var body: some View {
      VStack(alignment: .leading, spacing: 10) {
        Text("What Brings you")
          .font(.custom(HelveticaNeue.medium, size: 28))
        
        Text("to Silent Moon?")
          .font(.custom(HelveticaNeue.light, size: 28))
        
        Text("choose a topic to focuse on:")
          .font(.custom(HelveticaNeue.light, size: 20))
          .foregroundColor(Colors.grayText)
        
        ScrollView(.vertical, showsIndicators: false) {
          HStack {
            VStack {
              ForEach(1..<9) { _ in
                Rectangle()
                  .frame(minWidth: 0, maxWidth: .infinity)
                  .frame(height: CGFloat.random(in: 167...210))
                  .frame(minHeight: 167)
                  .cornerRadius(10)
              }
            }
            VStack {
              ForEach(1..<9) { _ in
                Rectangle()
                  .frame(minWidth: 0, maxWidth: .infinity)
                  .frame(height: CGFloat.random(in: 167...210))
                  .cornerRadius(10)
              }
            }
          }
        }
        .padding()
      }
    }
}

struct ChooseTopicView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseTopicView()
    }
}
