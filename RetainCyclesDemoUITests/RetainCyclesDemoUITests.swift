//
//  RetainCyclesDemoUITests.swift
//  RetainCyclesDemoUITests
//
//  Created by Gero Herkenrath on 15.02.23.
//

import XCTest

final class RetainCyclesDemoUITests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testExample() throws {
        let app = XCUIApplication()
        app.launch()
    }
}
