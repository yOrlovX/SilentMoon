//
//  RemindersView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 25.05.2023.
//

import SwiftUI

struct RemindersView: View {
  @State private var selectedTime = Date()
  
  var body: some View {
    
    VStack(alignment: .leading, spacing: 15) {
      Spacer()
      Text("What time would you like to meditate?")
        .font(.custom(HelveticaNeue.bold, size: 24))
      
      Text("Any time you can choose but We recommend first thing in th morning.")
        .font(.custom(HelveticaNeue.light, size: 16))
        .foregroundColor(Colors.grayText)
        .lineSpacing(5)
      
      DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
        .labelsHidden()
        .datePickerStyle(.wheel)
        .background(Colors.timePickerBg)
        .cornerRadius(20)
        .frame(maxWidth: .infinity)
      
      Text("Which day would you like to meditate??")
        .font(.custom(HelveticaNeue.bold, size: 24))
      
      Text("Everyday is best, but we recommend picking at least five.")
        .font(.custom(HelveticaNeue.light, size: 16))
        .foregroundColor(Colors.grayText)
        .lineSpacing(5)
      
      Spacer()
      
      Button(action: {}) {
        Text("SAVE")
          .modifier(PrimaryButtonModifier())
      }
      
      Button(action: {}) {
        Text("NO THANKS")
          .foregroundColor(.black)
          .frame(maxWidth: .infinity)
      }
      
      Spacer()
    }
    .padding(.horizontal, 20)
  }
}

struct RemindersView_Previews: PreviewProvider {
  static var previews: some View {
    RemindersView()
  }
}
