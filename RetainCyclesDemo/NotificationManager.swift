//
//  NotificationManager.swift
//  RetainCyclesDemo
//
//  Created by Gero Herkenrath on 15.02.23.
//

import Foundation

enum NotificationManager {

    static let notificationName = Notification.Name("\(UUID().uuidString).retainDemoNotification")

    static func postNotification() {
        print("\nPosting ONE notification")
        NotificationCenter.default.post(Notification(name: Self.notificationName))
    }
}
