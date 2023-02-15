//
//  ProblemModel.swift
//  RetainCyclesDemo
//
//  Created by Gero Herkenrath on 15.02.23.
//

import Foundation
import Combine

@MainActor class ProblemModel: ObservableObject {

    @Published var caughtNotificationsCount = 0

    private var listener: NotificationListener?
    private let uuid = UUID()

    init() {
        print("creating a new model with UUID: \(uuid.uuidString)")
//        listener = NotificationListener(callback: increaseCounter)
        let weakThunk: @MainActor () -> Void = { [weak self] in
            self?.increaseCounter()
        }
        listener = NotificationListener(callback: weakThunk)
    }

    func increaseCounter() {
        print("processing notification: increasing counter of model \(uuid.uuidString)")
        caughtNotificationsCount += 1
    }
}

@MainActor class NotificationListener {

    private var callback: (@MainActor () -> Void)
    private var subscriber: AnyCancellable?

    init(callback: (@escaping @MainActor () -> Void)) {
        self.callback = callback
        let notiCenter = NotificationCenter.default
        subscriber = notiCenter.publisher(for: NotificationManager.notificationName).sink { [weak self] _ in
            self?.doCallback()
        }
    }

    private func doCallback() {
        callback()
    }
}
