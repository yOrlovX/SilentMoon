//
//  DailyThoughtCell.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 08.06.2023.
//

import SwiftUI

struct DailyThoughtView: View {
  @State private var showPlayer = false
  @State private var selectedImage: String = ""
  @State private var title: String = ""
  @State private var track: String = ""
  
  let category = TopicData.data
  
  var body: some View {
    ZStack {
      HStack {
        Spacer()
        VStack(alignment: .leading, spacing: 10) {
          Text("Daily Thought")
            .font(.custom(HelveticaNeue.bold, size: 18))
            .foregroundColor(.white)
            .shadow(radius: 5)
          HStack(spacing: 5) {
            Text("MEDITATION")
              .font(.custom(HelveticaNeue.medium, size: 11))
              .foregroundColor(.white)
              .shadow(color: .black, radius: 20)
            Text("3-10 min")
              .font(.custom(HelveticaNeue.medium, size: 11))
              .foregroundColor(.white)
              .shadow(radius: 5)
          }
        }
        Spacer()
        Button(action: { getRandomSong()
          showPlayer = true }) {
            Image(systemName: "play.fill")
              .padding(10)
              .background(.white)
              .cornerRadius(25)
          }
          .foregroundColor(.black)
        Spacer()
      }
    }
    .frame(width: UIScreen.main.bounds.width - 40, height: 95)
    .background(Image("\(Int.random(in: 1...6))")
      .opacity(0.8)
    )
    .cornerRadius(12)
    .fullScreenCover(isPresented: $showPlayer) {
      PlayerView(selectedImage: $selectedImage, title: $title, selectedTrack: $track)
    }
  }
  
  func getRandomSong() {
    for song in category.shuffled() {
      selectedImage = song.image
      title = song.name
      track = song.fileName
    }
  }
}

struct DailyThoughtView_Previews: PreviewProvider {
  static var previews: some View {
    DailyThoughtView()
  }
}
