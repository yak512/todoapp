//
//  iOSRecruitmentUITests.swift
//  iOSRecruitmentUITests
//
//  Created by Yakoub on 16/01/2021.
//  Copyright © 2021 cheerz. All rights reserved.
//

import XCTest

class iOSRecruitmentUITests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        
        app = XCUIApplication()
        app.launchArguments.append("ui-testing")
        sleep(1)
        }
    
    func testTapFirstTask() {
        app = XCUIApplication()
        app.launch()
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        sleep(2)
    }
    
    func testTapFirstTaskAndGoBack() {
        app = XCUIApplication()
        app.launch()
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        sleep(2)
        app.buttons["Back"].tap()
        sleep(2)
    }
}
