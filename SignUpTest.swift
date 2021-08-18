//
// Copyright © 2020 The Go-Ahead Group plc. All rights reserved.
//
import XCTest

extension SignUpTest: ActionPerformer {}
extension SignUpTest: AssertionMaker {}
extension SignUpTest: PrettyTester {}
extension SignUpTest: EnvironmentBuilder {}

fileprivate var signUpCode = ""

class SignUpTest: XCTestCase {
    var app: XCUIApplication!
    lazy var randomemail: String = getEmailFromDate()

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchEnvironment.setEnvironment(value: true, for: .isRunningUITests)
    }
    
    func testSignUp() {
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
            userTapsCreateAccountFromInfoTab()
        }
        
        then {
            signUpEmailScreenIsPresent()
        }
        
        when {
            app.textFields["name@domain.com"].typeText(randomemail)
            app.children(matching: .window).element(boundBy: 0).buttons["Continue"].tap()
        }
        
        then {
            signUpNameScreenIsPresent()
        }
        
        when {
            userTapsContinueWhatsYourNameScreen()
        }
        
        then {
            signUpPasswordScreenIsPresent()
        }
        
        when {
            signUpEnterPasswordAndSkipMarketing()
        }
        
        then {
            signUpTermsPageisPresent()
        }
        
        when {
            userAcceptsTermsAndConditions()
        }
        
        then {
            userLandsOnCodeScreen()
            sleep(5)
        }
        
        when {
            getSignUpCode()
        }
        
        and {
            enterSignupCode(code: signUpCode)
        }
        
        finalize {
            // TODO: - uncomment call: it succeeds locally, but tends to fail on CI
            checkUserSignedUpOnAddMethodScreen()
        }
    }
    
    // MARK: - Helpers
    
    fileprivate func getSignUpCode() {
        let exp = expectation(description: "User gets sign-up code")

        getSignUpCode(email: randomemail, completionHandler: { (code) in
            signUpCode = code ?? "0000"
            exp.fulfill()
        })
        
        wait(for: [exp], timeout: 10)
    }
}
