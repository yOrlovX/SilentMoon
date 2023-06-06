//
//  AudioManager.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 06.06.2023.
//

import Foundation
import AVKit
import SwiftUI

final class AudioManager: ObservableObject {
  
  static let shared = AudioManager()
  
  var player: AVAudioPlayer?
  
  @Published var isPlaying: Bool = true
  
  
  private init() {
  }
  
  func startPlayer(track: String) {
    guard let url = Bundle.main.url(forResource: track, withExtension: "mp3") else { return }
    
    do {
      try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
      try AVAudioSession.sharedInstance().setActive(true)
      player = try AVAudioPlayer(contentsOf: url)
      
      if isPlaying {
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
}
