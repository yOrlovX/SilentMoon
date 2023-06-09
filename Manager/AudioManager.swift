//
//  AudioManager.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 06.06.2023.
//

import Foundation
import AVKit
import SwiftUI
import MediaPlayer

final class AudioManager: ObservableObject {
  
  static let shared = AudioManager()
  
  var player: AVAudioPlayer?
  
  @Published var isPlaying: Bool = true
  
  
  private init() {
  }
  
  func startPlayer(track: String, isPreview: Bool = false) {
    guard let url = Bundle.main.url(forResource: track, withExtension: "mp3") else { return }
    
    do {
      try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
      try AVAudioSession.sharedInstance().setActive(true)
      player = try AVAudioPlayer(contentsOf: url)
      
      if isPreview {
        player?.prepareToPlay()
      } else {
        player?.play()
      }
      
    } catch {
      print("Fail to initialize player", error)
    }
  }
  
  func playPause() {
    guard let player = player else { return }
    if player.isPlaying {
      player.pause()
    } else {
      player.play()
    }
  }
  
  func increase15Seconds() {
    guard let player = player else { return }
    player.currentTime += 15
  }
  
  func reduce15Seconds() {
    guard let player = player else { return }
    player.currentTime -= 15
  }
  
  func backgroundPlaying() {
    guard let player = player else { return }
    UIApplication.shared.beginReceivingRemoteControlEvents()
    MPRemoteCommandCenter.shared().playCommand.addTarget { _ in
      player.play()
      return .success
    }
    MPRemoteCommandCenter.shared().pauseCommand.addTarget { _ in
      player.pause()
      return .success
    }
  }
  
}
