//
//  CustomDayPicker.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 25.05.2023.
//

import SwiftUI

struct CustomDayPicker: View {
  @State var selectedDay: Int = 1
  let days = ["SU","M","T","W","TH","F","S"]
  let selectedCircleColor = Colors.dayCircleBg
  var body: some View {
    HStack {
      ForEach(Array(days.enumerated()), id: \.0) { index, day in
        Button(action: {  self.selectedDay = index + 1
          print(selectedDay) }) {
            Circle()
              .strokeBorder(Color.gray,lineWidth: 1)
              .frame(width: 40, height: 40)
              .foregroundColor(self.selectedDay == index ? .black : .white)
              .overlay {
                Text(day)
                  .font(.custom(HelveticaNeue.medium, size: 14))
                  .foregroundColor(Colors.grayText)
              }
          }
      }
    }
  }
}

struct CustomDayPicker_Previews: PreviewProvider {
  static var previews: some View {
    CustomDayPicker()
  }
}
