//
//  RecomendedCell.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 08.06.2023.
//

import SwiftUI

struct RecomendedCell: View {
  let recomended: Recomended
  
  var body: some View {
    
    VStack(alignment: .leading, spacing: 10) {
      Image(recomended.image)
        .resizable()
        .scaledToFit()
        .frame(width: 162, height: 114)
        .cornerRadius(20)
      
      Text(recomended.name)
        .font(.custom(HelveticaNeue.bold, size: 18))
      
      HStack(spacing: 5) {
        Text("MEDITATION")
          .font(.custom(HelveticaNeue.medium, size: 11))
          .foregroundColor(Colors.grayText)
        
        Text(recomended.duration)
          .font(.custom(HelveticaNeue.medium, size: 11))
          .foregroundColor(Colors.grayText)
      }
    }
  }
}


struct Recomended: Hashable, Identifiable {
  let id = UUID()
  let name: String
  let duration: String
  let image: String
  
  static let recomendedData = [
    Recomended(name: "Basic", duration: "3-10 min", image: "1"),
    Recomended(name: "Basic", duration: "3-10 min", image: "2"),
    Recomended(name: "Basic", duration: "3-10 min", image: "3"),
    Recomended(name: "Basic", duration: "3-10 min", image: "4"),
    Recomended(name: "Basic", duration: "3-10 min", image: "5"),
    Recomended(name: "Basic", duration: "3-10 min", image: "6")
  ]
}

struct RecomendedCell_Previews: PreviewProvider {
  static var previewsData =  Recomended(name: "Basic",duration: "3-10 min", image: "1")
  
  static var previews: some View {
    RecomendedCell(recomended: previewsData)
      .previewLayout(.sizeThatFits)
  }
}
