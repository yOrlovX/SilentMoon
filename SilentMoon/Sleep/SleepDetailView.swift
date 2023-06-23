//
//  CourseDetailView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 13.06.2023.
//

import SwiftUI

struct SleepDetailView: View {
  let sleep: Sleep
  
  var body: some View {
    ZStack {
      Colors.darkBackground
        .ignoresSafeArea()
      VStack {
        Image(sleep.image)
          .resizable()
          .scaledToFill()
          .frame(width: UIScreen.main.bounds.width)
          .frame(height: UIScreen.main.bounds.height / 3)
          .cornerRadius(20)
          .ignoresSafeArea()
        
        textSection
        
        HStack {
          Spacer()
          HStack {
            Image(systemName: "heart.fill")
              .resizable()
              .scaledToFill()
              .frame(width: 18, height: 18)
              .foregroundColor(.red)
            
            Text("\(sleep.favoritesCount) Favorits")
              .font(.custom(HelveticaNeue.medium, size: 14))
              .foregroundColor(Colors.grayText)
          }
          Spacer()
          Spacer()
          HStack {
            Image(systemName: "headphones")
              .resizable()
              .scaledToFill()
              .frame(width: 18, height: 18)
              .foregroundColor(.blue)
            
            Text("\(sleep.listeningCount) listening")
              .font(.custom(HelveticaNeue.medium, size: 14))
              .foregroundColor(Colors.grayText)
          }
          Spacer()
          Spacer()
          Spacer()
          Spacer()
        }
        .padding(.top, 20)
        
        Spacer()
      }
    }
  }
  
}

extension SleepDetailView {
  private var textSection: some View {
    VStack(alignment: .leading, spacing: 20) {
      Text(sleep.name)
        .foregroundColor(Colors.sleepText)
        .font(.custom(HelveticaNeue.bold, size: 34))
      
      Text(sleep.description)
        .font(.custom(HelveticaNeue.medium, size: 14))
        .foregroundColor(Colors.grayText)
      
      Text(sleep.detail)
        .font(.custom(HelveticaNeue.light, size: 16))
        .foregroundColor(Colors.grayText)
    }
    .padding(.horizontal, 20)
  }
}

struct Sleep: Hashable, Identifiable {
  let id = UUID()
  let name: String
  let description: String
  let duration: String
  let image: String
  let detail: String
  let favoritesCount: Int
  let listeningCount: Int
  
  static let courseData = [
    Sleep(name: "Mindful Moments", description: "Cultivate mindfulness through short daily exercises.", duration: "5-10 min", image: "1", detail: "Learn the basics of mindfulness and incorporate it into your daily life.", favoritesCount: 120, listeningCount: 230),
    Sleep(name: "Stress Relief", description: "Manage stress and find calmness in the midst of chaos.", duration: "8-12 min", image: "2", detail: "Discover effective techniques to reduce stress and improve well-being.", favoritesCount: 85, listeningCount: 180),
    Sleep(name: "Sleep Meditation", description: "Relax your mind and body for a restful night's sleep.", duration: "15-20 min", image: "3", detail: "Unwind before bedtime with soothing meditations to enhance sleep quality.", favoritesCount: 160, listeningCount: 320),
    Sleep(name: "Focus & Concentration", description: "Enhance your focus and improve productivity.", duration: "10-15 min", image: "4", detail: "Sharpen your concentration skills and stay focused on tasks.", favoritesCount: 100, listeningCount: 240),
    Sleep(name: "Emotional Well-being", description: "Manage emotions and promote emotional balance.", duration: "7-10 min", image: "5", detail: "Learn strategies to cultivate emotional resilience and well-being.", favoritesCount: 75, listeningCount: 190),
    Sleep(name: "Self-Compassion", description: "Develop self-compassion and nurture self-kindness.", duration: "12-15 min", image: "6", detail: "Practice self-compassion to enhance self-esteem and self-care.", favoritesCount: 110, listeningCount: 250)
  ]
}

struct SleepDetailView_Previews: PreviewProvider {
  static var previews: some View {
    let previewsData =  Sleep(name: "Mindful Moments", description: "Cultivate mindfulness through short daily exercises.", duration: "5-10 min", image: "1", detail: "Learn the basics of mindfulness and incorporate it into your daily life.", favoritesCount: 120, listeningCount: 230)
    SleepDetailView(sleep: previewsData)
  }
}


