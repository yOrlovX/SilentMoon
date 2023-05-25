//
//  WelcomeSleepView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 24.05.2023.
//

import SwiftUI

struct WelcomeSleepView: View {
  @State private var xOffset: CGFloat = 0
  @State private var yOffset: CGFloat = 0
  @State private var greenBirdRotation: Double = 0
  @State private var pinkBirdRotation: Double = 0
  @State private var opacity: Double = 0.1
  @State private var darkMoonOffset: Double = -35
  @State private var cloudsOpacity: Double = 0.2
  @State private var firstCloudXOffset: Double = 0
  @State private var secondCloudXOffset: Double = 0
  @State private var thirdCloudXOffset: Double = 0
  
    var body: some View {
      VStack {
        ZStack {
          Colors.darkBackground
            .ignoresSafeArea()
          
          Image("smoke")
            .resizable()
            .scaledToFill()
            .offset(x: xOffset)
          
          
          VStack(spacing: 0) {
            VStack(spacing: 50) {
              HStack(spacing: 0) {
                Image("lightMoon")
                Image("darkMoon")
                  .offset(x: darkMoonOffset, y: -10)
              }
              Image("cloud")
                .resizable()
                .scaledToFit()
                .frame(width: 86, height: 41)
                .offset(x: -150)
                .opacity(cloudsOpacity)
                .offset(x: firstCloudXOffset)
              Image("cloud")
                .resizable()
                .scaledToFit()
                .frame(width: 44, height: 21)
                .opacity(cloudsOpacity)
                .offset(x: secondCloudXOffset)
              Image("cloud")
                .resizable()
                .scaledToFit()
                .frame(width: 114, height: 55)
                .offset(x: 150)
                .opacity(cloudsOpacity)
                .offset(x: thirdCloudXOffset)
            }
            .padding(.bottom, 40)
            HStack {
              Image("greenBird")
                .offset(y: yOffset)
                .rotationEffect(.degrees(greenBirdRotation))
              
              Image("z-z-z")
                .offset(y: -50)
                .opacity(opacity)
              Image("pinkBird")
                .offset(y: yOffset)
                .rotationEffect(.degrees(pinkBirdRotation))
            }
            Image("branch")
              .resizable()
              .scaledToFit()
              .offset(y: yOffset)
              .padding(.top, -40)
              
          }
//          .onAppear {
//            withAnimation(.linear.speed(0.2).repeatForever()) {
//              yOffset = 20
//              greenBirdRotation = 10
//              pinkBirdRotation = 10
//              opacity = 1
//              darkMoonOffset = 0
//              cloudsOpacity = 1
//              firstCloudXOffset = 100
//              secondCloudXOffset = -50
//              thirdCloudXOffset = -100
//            }
//          }
        }
      }
//      .onAppear {
//        withAnimation(.linear.speed(0.2).repeatForever()) {
//          xOffset = -15
//        }
//      }
    }
}

//struct WelcomeSleepView_Previews: PreviewProvider {
//    static var previews: some View {
//        WelcomeSleepView()
//    }
//}
