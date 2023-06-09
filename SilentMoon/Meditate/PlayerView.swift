//
//  PlayerView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 08.06.2023.
//

import SwiftUI

struct PlayerView: View {
  let audioManager = AudioManager.shared
  
  @State var isPreview: Bool = true
  @State private var showingAlert = false
  @State var value: Double = 0.0
  @State var isEditing: Bool = false
  @State var isPlaying: Bool = true
  
  @Environment(\.dismiss) var dismiss
  
  @Binding var selectedImage: String
  @Binding var title: String
  @Binding var selectedTrack: String
  
  let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()
  
  var body: some View {
    ZStack {
      Image(selectedImage)
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
      
      Rectangle()
        .background(.thinMaterial)
        .opacity(0.4)
        .ignoresSafeArea()
      
      VStack(spacing: 50){
        Spacer()
        HStack {
          Spacer()
          Button(action: { dismiss()
            audioManager.player?.stop()
          }) {
            Image(systemName: "xmark")
              .frame(width: 30, height: 30)
              .foregroundColor(.white)
              .padding(10)
              .foregroundColor(.white)
              .background(Colors.grayText)
              .clipShape(Capsule())
              .opacity(0.7)
          }
          Spacer()
          Spacer()
          Spacer()
          Spacer()
          Spacer()
          Button(action: { showingAlert = true }) {
            Image(systemName: "heart.fill")
              .frame(width: 30, height: 30)
              .foregroundColor(.white)
              .padding(10)
              .foregroundColor(.white)
              .background(Colors.grayText)
              .clipShape(Capsule())
              .opacity(0.7)
          }
          Button(action: { showingAlert = true }) {
            Image(systemName: "tray.and.arrow.down")
              .frame(width: 30, height: 30)
              .foregroundColor(.white)
              .padding(10)
              .foregroundColor(.white)
              .background(Colors.grayText)
              .clipShape(Capsule())
              .opacity(0.7)
          }
          Spacer()
        }
        .alert("Coming soon 🙂", isPresented: $showingAlert) {
          Button("OK", role: .cancel) { }
        }
        Spacer()
        Spacer()
        Text(title)
          .font(.custom(HelveticaNeue.bold, size: 34))
          .foregroundColor(.white)
        
        HStack(spacing: 70) {
          Button(action: { audioManager.reduce15Seconds() }) {
            Image(systemName: "gobackward.15")
              .playerButtonModifier()
          }
          Button(action: { audioManager.playPause()
            isPlaying.toggle()
          }) {
            Image(systemName: isPlaying ? "play.fill" : "pause.fill")
              .playPauseButtonModifier()
          }
          Button(action: { audioManager.increase15Seconds() }) {
            Image(systemName: "goforward.15")
              .playerButtonModifier()
          }
        }
        
        if let player = audioManager.player {
          VStack(spacing: 5) {
            Slider(value: $value, in: 0...player.duration) { editing in
              if !editing {
                player.currentTime = value
              }
            }
            HStack {
              Text("\(formatTimeInterval(player.currentTime))")
                .foregroundColor(.white)
              Spacer()
              Text("\(formatTimeInterval(player.duration))")
                .foregroundColor(.white)
            }
          }
          .accentColor(.white)
          .padding()
        }
        Spacer()
      }
    }
    .onAppear {
      audioManager.startPlayer(track: selectedTrack, isPreview: isPreview)
    }
    .onReceive(timer, perform: { _ in
      guard let player = audioManager.player, !isEditing else { return }
      value = player.currentTime
    })
  }
}

extension PlayerView {
  func formatTimeInterval(_ interval: TimeInterval) -> String {
    let minutes = Int(interval / 60)
    let seconds = Int(interval.truncatingRemainder(dividingBy: 60))
    return String(format: "%02d:%02d", minutes, seconds)
  }
}

struct PlayerView_Previews: PreviewProvider {
  static var previews: some View {
    PlayerView(selectedImage: .constant("playerBg"), title: .constant("Focus Attention"), selectedTrack: .constant("track1"))
  }
}
