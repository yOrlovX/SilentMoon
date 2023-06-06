//
//  SongsViewModel.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 06.06.2023.
//

import Foundation

final class SongsViewModel: ObservableObject {
  @Published var songs: [Song] = []
  var song = Song.songsData
  
  init() {
    getSongFromAssets()
  }
  
  func getSongFromAssets() {
    songs.append(song)
  }
  
}


struct Song {
  let id = UUID()
  let fileName: String
  
  static let songsData = Song(fileName: "storm-clouds-purpple-cat")
}
