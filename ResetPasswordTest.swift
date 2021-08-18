//
// Copyright © 2020 The Go-Ahead Group plc. All rights reserved.
//

import XCTest
import Foundation

extension ResetPasswordTest: ActionPerformer {}
extension ResetPasswordTest: AssertionMaker {}
extension ResetPasswordTest: PrettyTester {}
extension ResetPasswordTest: EnvironmentBuilder {}

var resetcode = ""
var resetUser = "resetpwdtest.ntkbz69w@mailosaur.io"

class ResetPasswordTest: XCTestCase {
    var app: XCUIApplication!
    lazy var newPassword: String = getPasswordFromDate()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchEnvironment.setEnvironment(value: true, for: .isRunningUITests)
    }
    
    func testResetPassword() {
        
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
        
        then {
            signUpEmailScreenIsPresent()
        }
        
        when {
            userEntersEmailWrongPasswordAndReqCode()
        }
        
        then {
            confirmPasswordResetScreenIsPresent()
        }
        
        when {
            enterIncorrectCode()
        }
        
        and {
            sleep(4)
            getResetPasswordCode(email: resetUser, completionHandler: { (code) in
               if code.count > 0 {
                resetcode = code[0].replacingOccurrences(of: " ", with: "")
                } else {
                XCTFail("No Code Found")
                }
            }
            )
            sleep(5)
        }
        
        and {
            enterResetPasswordCode(code: resetcode)
        }
        
        then {
            signUpPasswordScreenIsPresent()
        }
        
        when {
            app.secureTextFields["Make it secure"].typeText(newPassword)
            tapContinueResetPwd()
            sleep(1)
        }
        
        then {
            signUpEmailScreenIsPresent()
        }
        
        when {
            app.scrollViews.otherElements.secureTextFields["Password"].tap()
            app.scrollViews.otherElements/*@START_MENU_TOKEN@*/.buttons["Clear text"]/*[[".secureTextFields[\"Password\"].buttons[\"Clear text\"]",".buttons[\"Clear text\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
            app.secureTextFields["Password"].typeText(newPassword)
            app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .button)["Log in"].tap()
            sleep(5)
        }
        
        finalize {
            userNavigatesFromInfoTabToPaymentMethods() //checks button on account page is there
        }
    }
}
