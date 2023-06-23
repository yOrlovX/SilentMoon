//
//  SleepCell.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 22.06.2023.
//

import SwiftUI

struct SleepCell: View {
  let sleep: Sleep
  
    var body: some View {
      VStack(alignment: .leading, spacing: 10) {
        Image(sleep.image)
          .resizable()
          .scaledToFit()
          .frame(maxWidth: .infinity)
          .cornerRadius(10)
        
        Text(sleep.name)
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

struct SleepCell_Previews: PreviewProvider {
    static var previews: some View {
        SleepCell()
    }
}
