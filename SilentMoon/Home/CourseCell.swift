//
//  CourseCell.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 07.06.2023.
//

import SwiftUI

struct CourseCell: View {
  let course: Course
  
    var body: some View {
      ZStack {
        VStack(alignment: .leading, spacing: 10) {
          Spacer()
          Text(course.name)
            .font(.custom(HelveticaNeue.bold, size: 18))
            .foregroundColor(.white)
            .shadow(radius: 20)
          Text(course.description)
            .font(.custom(HelveticaNeue.medium, size: 15))
            .foregroundColor(.white)
            .shadow(radius: 20)
          Spacer()
          HStack(spacing: 25) {
            Text(course.duration)
              .font(.custom(HelveticaNeue.medium, size: 11))
              .foregroundColor(.white)
            Text("START")
              .font(.custom(HelveticaNeue.medium, size: 12))
              .padding(.horizontal, 15)
              .padding(.vertical, 10)
              .background(.white)
              .cornerRadius(25)
          }
          Spacer()
        }
      }
      .frame(width: 177, height: 210)
      .background(Image(course.image))
      .cornerRadius(15)
    }
}

struct CourseCell_Previews: PreviewProvider {
  static var previewsData =  Course(name: "Mindful Moments", description: "Cultivate mindfulness through short daily exercises.", duration: "5-10 min", image: "mindful_moments", detail: "Learn the basics of mindfulness and incorporate it into your daily life.", favoritesCount: 120, listeningCount: 230)
    
  static var previews: some View {
      CourseCell(course: previewsData)
        .previewLayout(.sizeThatFits)
    }
}


struct Course: Hashable, Identifiable {
  let id = UUID()
  let name: String
  let description: String
  let duration: String
  let image: String
  let detail: String
  let favoritesCount: Int
  let listeningCount: Int
  
  static let courseData = [
    Course(name: "Mindful Moments", description: "Cultivate mindfulness through short daily exercises.", duration: "5-10 min", image: "1", detail: "Learn the basics of mindfulness and incorporate it into your daily life.", favoritesCount: 120, listeningCount: 230),
    Course(name: "Stress Relief", description: "Manage stress and find calmness in the midst of chaos.", duration: "8-12 min", image: "2", detail: "Discover effective techniques to reduce stress and improve well-being.", favoritesCount: 85, listeningCount: 180),
    Course(name: "Sleep Meditation", description: "Relax your mind and body for a restful night's sleep.", duration: "15-20 min", image: "3", detail: "Unwind before bedtime with soothing meditations to enhance sleep quality.", favoritesCount: 160, listeningCount: 320),
    Course(name: "Focus & Concentration", description: "Enhance your focus and improve productivity.", duration: "10-15 min", image: "4", detail: "Sharpen your concentration skills and stay focused on tasks.", favoritesCount: 100, listeningCount: 240),
    Course(name: "Emotional Well-being", description: "Manage emotions and promote emotional balance.", duration: "7-10 min", image: "5", detail: "Learn strategies to cultivate emotional resilience and well-being.", favoritesCount: 75, listeningCount: 190),
    Course(name: "Self-Compassion", description: "Develop self-compassion and nurture self-kindness.", duration: "12-15 min", image: "6", detail: "Practice self-compassion to enhance self-esteem and self-care.", favoritesCount: 110, listeningCount: 250)
  ]
}
