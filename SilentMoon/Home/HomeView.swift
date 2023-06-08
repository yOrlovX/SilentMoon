//
//  HomeView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 27.05.2023.
//

import SwiftUI

struct HomeView: View {
  
  let courses = Course.courseData
  let recomended = Recomended.recomendedData
  
    var body: some View {
      VStack(spacing: 20) {
        logoContainer
        VStack(alignment: .leading) {
          VStack(alignment: .leading, spacing: 10) {
            Text("Good Morning, Afsar")
              .font(.custom(HelveticaNeue.bold, size: 28))
            Text("We Wish you have a good day")
              .font(.custom(HelveticaNeue.light, size: 20))
              .foregroundColor(Colors.grayText)
          }
          .padding(.horizontal, 20)
            coursesContainer
          
          DailyThoughtView()
            .padding(.leading, 20)
            .padding(.top, 20)
          
          recomendedContainer
        }
      }
    }
}

extension HomeView {
  private var logoContainer: some View {
    HStack(spacing: 10) {
      Text("Silent")
        .font(.system(size: 16, weight: .bold))
      Image("logo")
      Text("Moon")
        .font(.system(size: 16, weight: .bold))
    }
  }
  
  private var coursesContainer: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(spacing: 20) {
        ForEach(courses, id: \.self) { course in
          CourseCell(course: course)
        }
      }
    }
    .frame(height: 210)
    .padding(.horizontal, 20)
  }
  
  private var recomendedContainer: some View {
    VStack(alignment: .leading) {
      Text("Recomended for you")
        .font(.custom(HelveticaNeue.medium, size: 24))
        .padding(.leading, 20)
      ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 20) {
          ForEach(recomended, id: \.self) { data in
           RecomendedCell(recomended: data)
          }
        }
      }
      .frame(height: 210)
      .padding(.horizontal, 20)
    }
  }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
