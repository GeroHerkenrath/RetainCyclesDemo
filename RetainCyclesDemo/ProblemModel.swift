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

        // this next line introduces a retain cycle!
        // passing the `increaseCounter` function as closure here implicitly captures `self`!
        listener = NotificationListener(callback: increaseCounter)

        // basically the following code is equivalent to the above problematic line:
        // `self` is captured inside the closure and since the closure is `@escaping` and will be stored
        // in a private property inside `listener`, `listener` de facto owns it. That's a proiblem because
        // this instance of the model (i.e. `self` here) also owns `listener`!
//        let badThunk: @MainActor () -> Void = { [self] in
//            increaseCounter()
//        }
//        listener = NotificationListener(callback: badThunk)

        // this here is the proper way to do it:
        // we do not capture `self` by only using a weak reference to it. That way `listener` does not
        // own "us", i.e. this model instance (i.e. `self`) and we keep the proper parent/child relationship
//        let weakThunk: @MainActor () -> Void = { [weak self] in
//            self?.increaseCounter()
//        }
//        listener = NotificationListener(callback: weakThunk)
    }

    deinit {
        print("deiniting model with UUID: \(uuid.uuidString)")
    }

    func increaseCounter() {
        print("processing notification: increasing counter of model \(uuid.uuidString)")
        caughtNotificationsCount += 1
    }
}

@MainActor class NotificationListener {

    private var callback: (@MainActor () -> Void)
    private var subscriber: AnyCancellable?
    private let uuid = UUID()

    init(callback: (@escaping @MainActor () -> Void)) {
        print("creating a new listener with UUID: \(uuid.uuidString)")
        self.callback = callback
        let notiCenter = NotificationCenter.default
        subscriber = notiCenter.publisher(for: NotificationManager.notificationName).sink { [weak self] _ in
            self?.doCallback()
        }
    }

    deinit {
        print("deiniting listener with UUID: \(uuid.uuidString)")
    }

    private func doCallback() {
        print("invoking callback registered in listener \(uuid.uuidString)")
        callback()
    }
}
