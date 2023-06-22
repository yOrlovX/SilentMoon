//
//  SleepView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 22.06.2023.
//

import SwiftUI

struct SleepView: View {
  
  let category = TopicData.data
  
  let columns = [
    GridItem(.adaptive(minimum: 167), spacing: 20),
    GridItem(.adaptive(minimum: 167))
  ]
  
  var body: some View {
    ZStack {
      Colors.darkBackground
        .ignoresSafeArea()
      
      ScrollView {
        VStack(spacing: 15) {
          textsSection
          mainSleepSection
          
          ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 20) {
              ForEach(category, id: \.self) { data in
                VStack(alignment: .leading, spacing: 10) {
                  Image(data.image)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
                  
                  Text(data.name)
                    .foregroundColor(Colors.sleepText)
                    .font(.custom(HelveticaNeue.bold, size: 18))
                  
                  HStack {
                    Text("45 MIN ")
                      .foregroundColor(Colors.sleepText)
                      .font(.custom(HelveticaNeue.medium, size: 11))
                    
                    Text("SLEEP MUSIC")
                      .foregroundColor(Colors.sleepText)
                      .font(.custom(HelveticaNeue.medium, size: 11))
                  }
                }
              }
            }
            .padding(.top, 30)
            .padding(.horizontal, 20)
          }
        }
      }
      .padding(.bottom, 20)
    }
  }
}

extension SleepView {
  private var textsSection: some View {
    VStack(spacing: 15) {
      Text("Sleep Stories")
        .foregroundColor(Colors.sleepText)
        .font(.custom(HelveticaNeue.bold, size: 28))
      
      Text("Soothing bedtime stories to help you fall into a deep and natural sleep")
        .foregroundColor(Colors.sleepText)
        .font(.custom(HelveticaNeue.light, size: 16))
        .multilineTextAlignment(.center)
        .padding(.horizontal)
    }
  }
  
  private var mainSleepSection: some View {
    Image("sleepMain")
      .resizable()
      .scaledToFit()
      .overlay {
        VStack(spacing: 10) {
          Text("The ocean moon")
            .foregroundColor(Colors.sleepText)
            .font(.custom(HelveticaNeue.bold, size: 28))
          Text("Non-stop 8- hour mixes of our most popular sleep audio")
            .foregroundColor(Colors.sleepText)
            .font(.custom(HelveticaNeue.light, size: 16))
            .multilineTextAlignment(.center)
            .padding(.horizontal)
          
          Button(action: {}) {
            Text("START")
              .foregroundColor(.black)
              .font(.custom(HelveticaNeue.medium, size: 12))
              .padding(.horizontal, 15)
              .padding(.vertical, 10)
              .background(.white)
              .cornerRadius(25)
          }
          .padding(.top, 15)
        }
      }
  }
}
struct SleepView_Previews: PreviewProvider {
  static var previews: some View {
    SleepView()
  }
}
