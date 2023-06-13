//
//  CourseDetailView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 13.06.2023.
//

import SwiftUI

struct CourseDetailView: View {
  let course: Course
  
  var body: some View {
    ZStack {
      VStack {
        Image(course.image)
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
            
            Text("\(course.favoritesCount) Favorits")
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
            
            Text("\(course.listeningCount) listening")
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

extension CourseDetailView {
  private var textSection: some View {
    VStack(alignment: .leading, spacing: 20) {
      Text(course.name)
        .font(.custom(HelveticaNeue.bold, size: 34))
      
      Text(course.description)
        .font(.custom(HelveticaNeue.medium, size: 14))
        .foregroundColor(Colors.grayText)
      
      Text(course.detail)
        .font(.custom(HelveticaNeue.light, size: 16))
        .foregroundColor(Colors.grayText)
    }
    .padding(.horizontal, 20)
  }
}

struct CourseDetailView_Previews: PreviewProvider {
  static var previews: some View {
    let previewsData =  Course(name: "Mindful Moments", description: "Cultivate mindfulness through short daily exercises.", duration: "5-10 min", image: "1", detail: "Learn the basics of mindfulness and incorporate it into your daily life.", favoritesCount: 120, listeningCount: 230)
    CourseDetailView(course: previewsData)
  }
}


