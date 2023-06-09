//
//  PlayerView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 08.06.2023.
//

import SwiftUI

struct PlayerView: View {
  @State var value: Double = 0.0
  
    var body: some View {
      ZStack {
        Image("playerBg")
          .resizable()
          .scaledToFill()
          .blur(radius: 5)
          .ignoresSafeArea()
          .padding(-20)
          .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        
        VStack(spacing: 50){
//        MARK: Buttons
          Spacer()
          HStack {
            Spacer()
            Button(action: {}) {
              Image(systemName: "xmark")
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .padding(10)
                .foregroundColor(.white)
                .background(Colors.grayText)
                .clipShape(Capsule())
                .opacity(0.7)
            }
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Spacer()
            Button(action: {}) {
              Image(systemName: "heart.fill")
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .padding(10)
                .foregroundColor(.white)
                .background(Colors.grayText)
                .clipShape(Capsule())
                .opacity(0.7)
            }
            
            Button(action: {}) {
              Image(systemName: "tray.and.arrow.down")
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .padding(10)
                .foregroundColor(.white)
                .background(Colors.grayText)
                .clipShape(Capsule())
                .opacity(0.7)
            }
            Spacer()
          }
          
          Spacer()
          Spacer()
          
          Text("Focus Attention")
            .font(.custom(HelveticaNeue.bold, size: 34))
            .foregroundColor(.white)
          Text("7 DAYS OF CALM")
            .font(.custom(HelveticaNeue.medium, size: 14))
            .foregroundColor(.white)
          
          HStack(spacing: 70) {
            
            Button(action: {}) {
              Image(systemName: "gobackward.15")
                .playerButtonModifier()
            }
            Button(action: {}) {
              Image(systemName: "play.fill")
                .playPauseButtonModifier()
            }
            
            Button(action: {}) {
              Image(systemName: "goforward.15")
                .playerButtonModifier()
            }
            
          }
          
          VStack(spacing: 5) {
            Slider(value: $value, in: 0...60)
              .padding()
            HStack {
              Text("0:00")
                .foregroundColor(.white)
              Spacer()
              Text("1:00")
                .foregroundColor(.white)
            }
          }
          .accentColor(.white)
          .padding()
          Spacer()
        }
      }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
