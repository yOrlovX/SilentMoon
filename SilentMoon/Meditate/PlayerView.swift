//
//  PlayerView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 08.06.2023.
//

import SwiftUI

struct PlayerView: View {
  @State private var showingAlert = false
  @State var value: Double = 0.0
  @Environment(\.dismiss) var dismiss
  @Binding var selectedImage: String
  @Binding var title: String
  
  var body: some View {
    ZStack {
      Image(selectedImage)
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
      
      Rectangle()
        .background(.thinMaterial)
        .opacity(0.4)
        .ignoresSafeArea()
      
      VStack(spacing: 50){
        //        MARK: Buttons
        Spacer()
        HStack {
          Spacer()
          Button(action: { dismiss() }) {
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
          Button(action: { showingAlert = true }) {
            Image(systemName: "heart.fill")
              .frame(width: 30, height: 30)
              .foregroundColor(.white)
              .padding(10)
              .foregroundColor(.white)
              .background(Colors.grayText)
              .clipShape(Capsule())
              .opacity(0.7)
          }
          
          Button(action: { showingAlert = true }) {
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
        .alert("Coming soon 🙂", isPresented: $showingAlert) {
          Button("OK", role: .cancel) { }
        }
        
        Spacer()
        Spacer()
        
        Text(title)
          .font(.custom(HelveticaNeue.bold, size: 34))
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
    PlayerView(selectedImage: .constant("playerBg"), title: .constant("Focus Attention"))
  }
}
