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


struct Song: Identifiable, Hashable {
  let id = UUID()
  let fileName: String
  
  static let songsData = Song(fileName: "storm-clouds-purpple-cat")
  static let songsArray = [Song(fileName: "track1"),
                           Song(fileName: "track2"),
                           Song(fileName: "track3"),
                           Song(fileName: "track4"),
                           Song(fileName: "track5"),
                           Song(fileName: "track6")
  ]
}
