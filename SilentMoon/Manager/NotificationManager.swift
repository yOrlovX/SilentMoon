//
//  NotificationManager.swift
//  SilentMoon
//
//  Created by Yaroslav Orlov on 13.06.2023.
//

import SwiftUI
import UserNotifications

class NotificationManager: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    @Published var selectedTime = Date()

    override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
    }

  func scheduleNotification() {
      let content = UNMutableNotificationContent()
      content.title = "SilentMoon Reminder"
      content.body = "It's time to meditate!"

      let triggerDate = Calendar.current.date(from: Calendar.current.dateComponents([.hour, .minute], from: selectedTime))
      guard let triggerDate = triggerDate else {
          print("Invalid trigger date")
          return
      }

      let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.hour, .minute], from: triggerDate), repeats: true)

      let request = UNNotificationRequest(identifier: "silentMoonReminder", content: content, trigger: trigger)

      UNUserNotificationCenter.current().add(request) { error in
          if let error = error {
              print("Error scheduling notification: \(error.localizedDescription)")
          } else {
              print("Notification scheduled successfully")
          }
      }
  }


//    func requestNotificationAuthorization() {
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
//            if granted {
//                print("Notification authorization granted")
//            } else if let error = error {
//                print("Error requesting notification authorization: \(error.localizedDescription)")
//            }
//        }
//    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // Customize the presentation options here
        completionHandler([.banner, .sound, .badge])
    }
}

