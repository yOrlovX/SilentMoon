//
//  CustomDayPicker.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 25.05.2023.
//

import SwiftUI

struct CircleView: View {
  let day: String
  @Binding var selectedDays: Set<String>
  
  var body: some View {
    ZStack {
      Circle()
        .foregroundColor(selectedDays.contains(day) ? Colors.dayCircleBg : Color.white)
        .frame(width: 50, height: 50)
        .overlay(
          Circle()
            .stroke(Colors.grayText, lineWidth: 1)
        )
      
      Text(day)
        .foregroundColor(selectedDays.contains(day) ? .white : Colors.grayText)
        .font(.headline)
    }
    .onTapGesture {
      if selectedDays.contains(day) {
        selectedDays.remove(day)
      } else {
        selectedDays.insert(day)
      }
    }
  }
}

struct CustomDayPicker: View {
  let days = ["SU", "M", "T", "W", "TH", "F", "S"]
  @State private var selectedDays: Set<String> = []
  
  var body: some View {
    HStack {
      ForEach(days, id: \.self) { day in
        CircleView(day: day, selectedDays: $selectedDays)
      }
    }
  }
}

struct CustomDayPicker_Previews: PreviewProvider {
  static var previews: some View {
    CustomDayPicker()
  }
}
