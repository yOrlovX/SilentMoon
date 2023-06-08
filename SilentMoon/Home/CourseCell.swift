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
  static var previewsData =  Course(name: "Basic", description: "COURSE", duration: "3-10 min", image: "1")
    
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
  
  static let courseData = [
    Course(name: "Basic", description: "COURSE", duration: "3-10 min", image: "1"),
    Course(name: "Basic", description: "COURSE", duration: "3-10 min", image: "2"),
    Course(name: "Basic", description: "COURSE", duration: "3-10 min", image: "3"),
    Course(name: "Basic", description: "COURSE", duration: "3-10 min", image: "4"),
    Course(name: "Basic", description: "COURSE", duration: "3-10 min", image: "5"),
    Course(name: "Basic", description: "COURSE", duration: "3-10 min", image: "6")
  ]
}
