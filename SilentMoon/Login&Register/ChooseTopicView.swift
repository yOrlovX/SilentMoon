//
//  ChooseTopicView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 28.05.2023.
//

import SwiftUI

struct ChooseTopicView: View {
  
  let columns = [
    GridItem(.adaptive(minimum: 167), spacing: 20),
    GridItem(.adaptive(minimum: 167))
  ]
  
  let category = TopicData.data
  
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
        LazyVGrid(columns: columns, spacing: 20) {
          ForEach(category, id: \.self) { data in
            VStack {
              Image(data.image)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity)
                .cornerRadius(10)
              
              Text(data.name)
                .font(.custom(HelveticaNeue.bold, size: 16))
            }
          }
        }
        .padding(.top, 30)
      }
    }
    .padding(.horizontal, 20)
  }
}

struct ChooseTopicView_Previews: PreviewProvider {
  static var previews: some View {
    ChooseTopicView()
  }
}

struct TopicData: Hashable {
  let image: String
  let name: String
  let fileName: String
  static let data = [TopicData(image: "1", name: "Personal Growth", fileName: "track1"),
                     TopicData(image: "2", name: "Reduce Stress", fileName: "track2"),
                     TopicData(image: "3", name: "Reduce Anxiety", fileName: "track3"),
                     TopicData(image: "4", name: "Better Sleep", fileName: "track4"),
                     TopicData(image: "5", name: "Increase Happiness", fileName: "track5"),
                     TopicData(image: "6", name: "Improve Performanee", fileName: "track6"),
                     
  ]
}
