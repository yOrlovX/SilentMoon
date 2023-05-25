//
//  SignInView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 25.05.2023.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
      VStack {
        Text("Hello, World!")
        Text("Hello, World!")
          .font(.custom(HelveticaNeue.bold, size: 20))
        Text("Hello, World!")
          .font(.custom(HelveticaNeue.medium, size: 20))
        Text("Hello, World!")
          .font(.custom(HelveticaNeue.light, size: 20))
      }
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
