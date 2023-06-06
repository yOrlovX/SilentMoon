//
//  MusicPlayer.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 29.05.2023.
//

import SwiftUI
import AVKit
import MediaPlayer
import Foundation

struct MusicPlayer: View {
  
  let audioManager = AudioManager.shared
  @StateObject var songsViewModel = SongsViewModel()
  var song = Song.songsData
  @State var isPlaying: Bool = false
  @State var value: Double = 0.0
  @State var isEditing: Bool = false
  
  @State var data: Data = .init(count: 0)
  @State var title = ""
  
  let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()
  
  @State var currentTime: TimeInterval = 0
  
  var body: some View {
    VStack(spacing: 20) {
      Image(uiImage: self.data.count == 0 ? UIImage(systemName: "music.quarternote.3")! : UIImage(data: self.data)!)
        .resizable()
        .scaledToFit()
        .frame(width: 300, height: 300)
        .cornerRadius(15)
      
      Text(self.title)
        .font(.custom(HelveticaNeue.bold, size: 34))
      
      Text("\(formatTimeInterval(audioManager.player?.currentTime ?? 0.0))")
        .font(.custom(HelveticaNeue.light, size: 16))
      
      if let player = audioManager.player {
        VStack(spacing: 5) {
          Slider(value: $value, in: 0...player.duration) { editing in
            if !editing {
              player.currentTime = value
            }
          }
          HStack {
            Text("\(formatTimeInterval(player.currentTime))")
            Spacer()
            Text("\(formatTimeInterval(player.duration - player.currentTime))")
          }
        }
        .accentColor(.black)
        .padding()
      }
      
      HStack(spacing: 40) {
        Button(action: {}) {
          Image(systemName: "backward.fill")
            .playerButtonModifier()
        }
        Button(action: { audioManager.reduce15Seconds() }) {
          Image(systemName: "gobackward.15")
            .playerButtonModifier()
        }
        Button(action: { isPlaying.toggle()
          audioManager.playPause()
        }) {
          Image(systemName: self.isPlaying ? "pause.fill" : "play.fill")
            .playPauseButtonModifier()
        }
        
        Button(action: { audioManager.increase15Seconds() }) {
          Image(systemName: "goforward.15")
            .playerButtonModifier()
        }
        Button(action: {}) {
          Image(systemName: "forward.fill")
            .playerButtonModifier()
        }
      }
    }
    .onAppear {
      audioManager.startPlayer(track: song.fileName)
      self.getData()
      // MARK: Play song when phone screen locked
//      backgroundPlaying()
    }
    .onReceive(timer, perform: { _ in
      guard let player = audioManager.player, !isEditing else { return }
      value = player.currentTime
    })
    // MARK: Play song when phone screen locked
    .onDisappear {
      UIApplication.shared.endReceivingRemoteControlEvents()
    }
  }
  
  func getData() {
    guard let url = audioManager.player?.url else { return }
    let asset = AVAsset(url: url)
    
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

extension MusicPlayer {
    
    //  func backgroundPlaying() {
    //    do {
    //      try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
    //      try AVAudioSession.sharedInstance().setActive(true)
    //    } catch {
    //      print("Failed to configure audio session:", error.localizedDescription)
    //    }
    //
    //    UIApplication.shared.beginReceivingRemoteControlEvents()
    //    MPRemoteCommandCenter.shared().playCommand.addTarget { _ in
    //      self.player.play()
    //      return .success
    //    }
    //    MPRemoteCommandCenter.shared().pauseCommand.addTarget { _ in
    //      self.player.pause()
    //      return .success
    //    }
    //  }
      
    func formatTimeInterval(_ interval: TimeInterval) -> String {
      let minutes = Int(interval / 60)
      let seconds = Int(interval.truncatingRemainder(dividingBy: 60))
      return String(format: "%02d:%02d", minutes, seconds)
    }
  }

//  struct MusicPlayer_Previews: PreviewProvider {
//      static var previews: some View {
//          MusicPlayer()
//      }
//  }

