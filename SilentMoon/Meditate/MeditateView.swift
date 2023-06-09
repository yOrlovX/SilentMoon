//
//  MeditateView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 08.06.2023.
//

import SwiftUI

struct MeditateView: View {
  @State private var showPlayer = false
  @State private var selectedImage: String = ""
  @State private var title: String = ""
  let columns = [
    GridItem(.adaptive(minimum: 167), spacing: 20),
    GridItem(.adaptive(minimum: 167))
  ]
  
  let category = TopicData.data
  
    var body: some View {
      VStack(spacing: 20) {
        Text("Meditate")
          .font(.custom(HelveticaNeue.bold, size: 28))
        Text("we can learn how to recognize when our minds are doing their normal everyday acrobatics.")
          .font(.custom(HelveticaNeue.light, size: 16))
          .foregroundColor(Colors.grayText)
          .multilineTextAlignment(.center)
          .padding(.horizontal, 20)
        DailyThoughtView()
        
        ScrollView(.vertical, showsIndicators: false) {
          LazyVGrid(columns: columns, spacing: 20) {
            ForEach(category, id: \.self) { data in
              VStack {
                Image(data.image)
                  .resizable()
                  .scaledToFit()
                  .frame(maxWidth: .infinity)
                  .cornerRadius(10)
                  .onTapGesture {
                    showPlayer = true
                    selectedImage = data.image
                    title = data.name
                  }
                
                Text(data.name)
                  .font(.custom(HelveticaNeue.bold, size: 16))
              }
            }
          }
          .padding(.top, 30)
        }
        .padding(.horizontal, 20)
      }
      .fullScreenCover(isPresented: $showPlayer) {
        PlayerView(selectedImage: $selectedImage, title: $title)
      }
    }
}

struct MeditateView_Previews: PreviewProvider {
    static var previews: some View {
        MeditateView()
    }
}
