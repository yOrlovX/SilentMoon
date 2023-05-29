//
//  MusicPlayer.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 29.05.2023.
//

import SwiftUI
import AVKit

struct MusicPlayer: View {
  
  @State var data: Data = .init(count: 0)
  @State var title = ""
  @State var player: AVAudioPlayer!
  @State var playing: Bool = false
  @State var width: CGFloat = 0
  
    var body: some View {
      VStack(spacing: 20) {
        Image(uiImage: self.data.count == 0 ? UIImage(systemName: "music.quarternote.3")! : UIImage(data: self.data)!)
          .resizable()
          .scaledToFit()
          .frame(width: 300, height: 300)
          .cornerRadius(15)
        
        Text(self.title)
          .font(.custom(HelveticaNeue.bold, size: 34))
        
        ZStack(alignment: .leading) {
          
          Capsule()
            .fill(.black.opacity(0.08))
            .frame(height: 2)
          
          Capsule()
            .fill(.black)
            .frame(width: 200, height: 2)
        }
        .padding()
        
        HStack(spacing: 40) {
          Button(action: {}) {
            Image(systemName: "backward.fill")
              .renderingMode(.template)
              .resizable()
              .foregroundColor(.black)
              .scaledToFit()
              .frame(width: 40, height: 40)
          }
          Button(action: {}) {
            Image(systemName: "gobackward.15")
              .renderingMode(.template)
              .resizable()
              .foregroundColor(.black)
              .scaledToFit()
              .frame(width: 40, height: 40)
          }
          Button(action: {
            
            if self.player.isPlaying {
              self.player.pause()
              self.playing = false
            } else {
              self.player.play()
              self.playing = true
            }
            
          }) {
            Image(systemName: self.playing ? "pause.fill" : "play.fill")
              .renderingMode(.template)
              .resizable()
              .foregroundColor(.black)
              .scaledToFit()
              .frame(width: 25, height: 25)
              .overlay {
                Circle()
                  .stroke(.gray.opacity(0.6), lineWidth: 1)
                  .frame(width: 80, height: 80)
              }
          }
          
          Button(action: {}) {
            Image(systemName: "gobackward.15")
              .renderingMode(.template)
              .resizable()
              .foregroundColor(.black)
              .scaledToFit()
              .frame(width: 40, height: 40)
          }
          Button(action: {}) {
            Image(systemName: "forward.fill")
              .renderingMode(.template)
              .resizable()
              .foregroundColor(.black)
              .scaledToFit()
              .frame(width: 40, height: 40)
          }
        }
      }
      .onAppear {
        let url = Bundle.main.path(forResource: "storm-clouds-purpple-cat", ofType: "mp3")
        
        self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
        self.player.prepareToPlay()
        self.getData()
        
        Timer
          .scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if self.player.isPlaying {
              
            }
          }
      }
    }
  
  func getData() {
    
    let asset = AVAsset(url: self.player.url!)
    
    for i in asset.commonMetadata {
      if i.commonKey?.rawValue == "artwork" {
        let data = i.value as! Data
        self.data = data
      }
      if i.commonKey?.rawValue == "title" {
        let title = i.value as! String
        self.title = title
      }
    }
  }
  
}

struct MusicPlayer_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayer()
    }
}
