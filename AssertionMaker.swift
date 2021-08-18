//
// Copyright © 2019 The Go-Ahead Group plc. All rights reserved.
//

import Foundation
import XCTest

protocol AssertionMaker: AppOwner {}

extension AssertionMaker {
    
    func assertionWhichIsAlwaysWrong() {
         XCTAssert(false, "Assertion is just wrong")
    }
    
    // MARK: - Sanity
    
    func applePayIsPresent() {
        let tablesQuery = app.tables
        XCTAssertTrue(tablesQuery.staticTexts["Apple Pay"].waitForExistence(timeout: 20))
    }
    
    func northTyne1DayIsPresent () {
        app.tabBars.buttons["Tickets"].tap()
        app.swipeUp()
        XCTAssertTrue(app.staticTexts["Adult • 1 Day"].waitForExistence(timeout: 20))
        XCTAssertTrue(app.staticTexts["North Tyne Saver"].waitForExistence(timeout: 20))
    }
    
    // MARK: - Signup

    func myAccountIsPresent () {
        let tablesQuery = app.tables
        XCTAssertTrue(tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["My account"]/*[[".cells.staticTexts[\"My account\"]",".staticTexts[\"My account\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.waitForExistence(timeout: 10))
    }
    
    func userLandsOnCodeScreen(){
        XCTAssert(app.staticTexts["Confirm account"].waitForExistence(timeout: 10))
    }
    
    func checkUserSignedUpOnAddMethodScreen() {
        XCTAssert(app.staticTexts["Payment methods"].waitForExistence(timeout: 10))
    }

//    func labelExistsInList(_ text: String) {
//        sleep(2) 
//        XCTAssertTrue(app.tables.otherElements[text].exists)
//    }
//
//    func topLabelIs(_ text: String) {
//         XCTAssertTrue(app.navigationBars[text].otherElements[text].exists)
//    }
//
//    func elementsInTheList(_ number: Int) {
//        XCTAssertEqual(app.tables.children(matching: .cell).count, number)
//    }
//
//    func labelExists(_ text: String) {
//        XCTAssertTrue(app.staticTexts[text].exists)
//    }
//
//    func buttonExistsInList(_ text: String) {
//        XCTAssertTrue(app.tables.buttons[text].exists)
//    }
//
    
}
