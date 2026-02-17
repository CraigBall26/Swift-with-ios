
import XCTest

extension PaymentMethods: ActionPerformer {}
extension PaymentMethods: AssertionMaker {}
extension PaymentMethods: PrettyTester {}
extension PaymentMethods: EnvironmentBuilder {}

class PaymentMethods: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchEnvironment.setEnvironment(value: true, for: .isRunningUITests)
    }

    func testaddApplePay () {
        given {
            useDB(fileName: DBNames.db0)
        }
        and {
            shouldShowOnboardingScreens(false)
        }
        and {
            isLoggedInWith(login: logins[0])
        }
        when {
            userLaunchesThaApp()
        }
        and {
           userNavigatesToInfoTab()
        }
        and {
            var tablesQuery = app.tables
            let paymentMethodsStaticText = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Payment methods"]/*[[".cells.staticTexts[\"Payment methods\"]",".staticTexts[\"Payment methods\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
                        paymentMethodsStaticText.tap()
            tablesQuery.children(matching: .cell).element(boundBy: 3).children(matching: .other).element(boundBy: 0).tap()
            app.navigationBars["Payment methods"].buttons["Back"].tap()
            paymentMethodsStaticText.tap()
            
            tablesQuery = app.tables
            let paymentMethodsNavigationBar = app.navigationBars["Payment methods"]
            paymentMethodsNavigationBar.buttons["Edit"].tap()
            
            tablesQuery = app.tables
            tablesQuery/*@START_MENU_TOKEN@*/.buttons["Delete Apple Pay"]/*[[".cells.buttons[\"Delete Apple Pay\"]",".buttons[\"Delete Apple Pay\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
            tablesQuery.buttons["Delete"].tap()
            paymentMethodsNavigationBar.buttons["Back"].tap()
            
        }
//        and {
//            userNavigatesFromInfoTabToPaymentMethods()
//        }
//        then {
//            XCTAssertEqual(app.tables.staticTexts["Apple Pay"].exists, false)
//        }
//        when {
//            addApplePay()
//        }
//        then {
//            sleep(1)
//            XCTAssertEqual(app.tables.staticTexts["Apple Pay"].exists, true)
//        }
//        when {
//            removeApplePay()
//        }
//        then {
//
//        }
    }
      
}
