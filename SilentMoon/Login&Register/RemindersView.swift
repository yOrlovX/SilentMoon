//
//  RemindersView.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 25.05.2023.
//

import SwiftUI
import UserNotifications

struct RemindersView: View {
  @State private var selectedTime = Date()
  @StateObject private var notificationManager = NotificationManager()
  
  var body: some View {
    VStack(spacing: RemindersViewAdaptiveSpacing.spacing) {
      headerTextSection
      DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
        .labelsHidden()
        .datePickerStyle(.wheel)
        .background(Colors.timePickerBg)
        .cornerRadius(20)
        .frame(maxWidth: .infinity)
      footerTextContainer
      CustomDayPicker()
      buttonsContainer
    }
    .navigationBarHidden(true)
    .padding(.horizontal, 20)
    .onAppear {
//      notificationManager.requestNotificationAuthorization()
    }
  }
}

extension RemindersView {
  private var buttonsContainer: some View {
    VStack(spacing: 20) {
      NavigationLink(destination: ChooseTopicView()) {
        Text("SAVE")
          .modifier(PrimaryButtonModifier())
          .onTapGesture {
            notificationManager.scheduleNotification()
          }
      }
      
      NavigationLink(destination: ChooseTopicView()) {
        Text("NO THANKS")
          .foregroundColor(.black)
          .font(.custom(HelveticaNeue.medium, size: 14))
      }
    }
  }
  
  private var headerTextSection: some View {
    VStack(alignment: .leading, spacing: 15) {
      Text("What time would you like to meditate?")
        .font(.custom(HelveticaNeue.bold, size: 24))
      Text("Any time you can choose but We recommend first thing in th morning.")
        .font(.custom(HelveticaNeue.light, size: 16))
        .foregroundColor(Colors.grayText)
        .lineSpacing(5)
    }
  }
  
  private var footerTextContainer: some View {
    VStack(alignment: .leading, spacing: 15) {
      Text("Which day would you like to meditate??")
        .font(.custom(HelveticaNeue.bold, size: 24))
      Text("Everyday is best, but we recommend picking at least five.")
        .font(.custom(HelveticaNeue.light, size: 16))
        .foregroundColor(Colors.grayText)
        .lineSpacing(5)
    }
  } 
}

struct RemindersView_Previews: PreviewProvider {
  static var previews: some View {
    RemindersView()
  }
}
