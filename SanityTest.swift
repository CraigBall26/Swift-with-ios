//
// Copyright © 2020 The Go-Ahead Group plc. All rights reserved.
//

import XCTest

extension SanityTest: ActionPerformer {}
extension SanityTest: AssertionMaker {}
extension SanityTest: PrettyTester {}
extension SanityTest: EnvironmentBuilder {}

class SanityTest: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchEnvironment.setEnvironment(value: true, for: .isRunningUITests)
    }
    
    func testSanity() {
        
        given {
            shouldNotShowMigrationScreen()
        }
        
        given {
            shouldShowOnboardingScreens(false)
        }
        
        given {
            shouldShowWhatsNewScreen(false)
        }
        
        given {
            isLoggedOut()
        }
        
        when {
            userLaunchesThaApp()
        }
        
        and {
            userNavigatesToInfoTab()
        }
        
        and {
            userTapsOnLogInFromInfoTab()
        }
        
        and {
            userEntersLogInDetailsForSanity()
        }
        
        then {
            myAccountIsPresent()
        }
        
        when {
            tapOnAddPaymentMethod()
        }
        
        and {
            addApplePay()
        }

        then {
           applePayIsPresent()
        }

        when {
            removeApplePay()
            navigatesToTicketsTab()
            tapsOnBuyTicketsButton()
            buyNorthTyne1Day()
        }
        
        then {
            northTyne1DayIsPresent()
        }
        
}

}
