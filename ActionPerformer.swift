import Foundation
import XCTest

protocol ActionPerformer: AppOwner {}
var app: XCUIApplication!

extension ActionPerformer {
    
    // MARK: - Shared
    
    func userLaunchesThaApp() {
        app.launch()
    }
    
    func userNavigatesToInfoTab() {
        app.tabBars.buttons["Info"].tap()
    }
    
    // MARK: - SanityTest
    
    func userTapsOnLogInFromInfoTab() {
        XCUIApplication().navigationBars["Info"].buttons["Log in"].tap()
    }
    
    func userEntersLogInDetailsForSanity () {
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.textFields["name@domain.com"].tap()
        elementsQuery.textFields["name@domain.com"].typeText("Testingact46@gmail.com")
        elementsQuery.secureTextFields["Password"].tap()
        elementsQuery.secureTextFields["Password"].typeText("Testtest123")
        
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .button)["Log in"].tap()
    }

    func userNavigatesFromInfoTabToPaymentMethods() {
        app.tables.staticTexts["Payment methods"].tap()
    }
    
    func tapOnAddPaymentMethod () {
        let tablesQuery = app.tables
        tablesQuery.staticTexts["Payment methods"].tap()
        app.swipeUp()
        app.tables.staticTexts["Add payment method"].tap()
    }
    
    func addApplePay() {
        app.scrollViews.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .other).element(boundBy: 1).tap()
    }
    
    func removeApplePay() {
        app.swipeUp()
        app.navigationBars["Payment methods"].buttons["Edit"].tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Delete Apple Pay"]/*[[".cells.buttons[\"Delete Apple Pay\"]",".buttons[\"Delete Apple Pay\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery.buttons["Delete"].tap()
    }
    
    func buyNorthTyne1Day () {
        XCUIApplication().swipeUp()
        //app.swipeUp()

        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Offering great savings travelling within Go Local zones"]/*[[".cells.staticTexts[\"Offering great savings travelling within Go Local zones\"]",".staticTexts[\"Offering great savings travelling within Go Local zones\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        sleep(2)
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["North Tyne"]/*[[".cells.staticTexts[\"North Tyne\"]",".staticTexts[\"North Tyne\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        app.buttons["£4.00"].tap()
        app.staticTexts["View basket  £4.00"].tap()
        app.buttons["Pay £4.00"].tap()

        sleep(20)

        let secureTextField = app.webViews.otherElements["bank_frame"].children(matching: .other).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 18).children(matching: .secureTextField).element
        secureTextField.tap()

        let moreKey = app/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"more, numbers\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey.tap()

        let key = app/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()

        let key2 = app/*@START_MENU_TOKEN@*/.keys["2"]/*[[".keyboards.keys[\"2\"]",".keys[\"2\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()

        let key3 = app/*@START_MENU_TOKEN@*/.keys["3"]/*[[".keyboards.keys[\"3\"]",".keys[\"3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key3.tap()

        let key4 = app/*@START_MENU_TOKEN@*/.keys["4"]/*[[".keyboards.keys[\"4\"]",".keys[\"4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key4.tap()

        app/*@START_MENU_TOKEN@*/.buttons["Go"]/*[[".keyboards.buttons[\"Go\"]",".buttons[\"Go\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()

        sleep(15)
    }
    
    // MARK: - SignUpTests
        
    func userTapsCreateAccountFromInfoTab() {
        app.tabBars.buttons["Info"].tap()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Create account"]/*[[".cells.staticTexts[\"Create account\"]",".staticTexts[\"Create account\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
        
    func startButtonIsTapped () {
        app.buttons["Start"].tap()
    }
    
    func getEmailFromDate () -> String {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyyMMddHHmmss"
        let formattedDate = format.string(from: date)
        let newmail = ".ntkbz69w@mailosaur.io"
        let createdmail = formattedDate + newmail
        return createdmail
    }
    
    func signUpEmailScreenIsPresent() {
        //XCTAssert(app.scrollViews.otherElements.textFields["name@domain.com"].exists)
        XCTAssert(app.scrollViews.otherElements.staticTexts["Password"].exists)
    }
    
    func signUpNameScreenIsPresent() {
        XCTAssert(app.scrollViews.otherElements.staticTexts["What's your name?"].exists)
    }
    
    func userTapsContinueWhatsYourNameScreen(){
        app.children(matching: .window).element(boundBy: 0).buttons["Continue"].tap()
    }
    
    func signUpPasswordScreenIsPresent() {
        XCTAssert(app.secureTextFields["Make it secure"].exists)
    }
    
    func signUpEnterPasswordAndSkipMarketing() {
        app.secureTextFields["Make it secure"].typeText("testtest")
        app.children(matching: .window).element(boundBy: 0).buttons["Continue"].tap()
        sleep(1)
        app.children(matching: .window).element(boundBy: 0).buttons["Continue"].tap()
        sleep(1)
    }
    
    func signUpTermsPageisPresent() {
        XCTAssert(app.staticTexts["Terms & conditions"].exists)
    }
    
    func userAcceptsTermsAndConditions() {
        app.children(matching: .window).element(boundBy: 0).buttons["Continue"].tap()
        let termsAndConditionsAlert = app.alerts["Terms and conditions"]
        termsAndConditionsAlert.buttons["OK"].tap()
        sleep(1)
        let firstSwitch = app.switches.element(boundBy: 0)
        XCTAssertEqual(firstSwitch.value as! String, "0")
        sleep(1)
        firstSwitch.tap()
        app.children(matching: .window).element(boundBy: 0).buttons["Continue"].tap()
    }
    
    func enterSignupCode(code: String) {
        for char in code {
            if char.isNumber {
                app.keys["more"].tap()
                app.keys[String(char)].tap()
                app.keys["more"].tap()
            } else {
                app.keys[String(char)].tap()
            }
        }
        app.children(matching: .window).element(boundBy: 0).buttons["Done"].tap()
    }
            
    func navigatesToTicketsTab() {
        app.tabBars.buttons["Tickets"].tap()
    }
    
    func tapsOnBuyTicketsButton() {
        app.navigationBars["Tickets"].buttons["Buy tickets"].tap()
    }
    
    func getSignUpCode(email: String, completionHandler: @escaping((_ code: String?) -> Void)) {
        let server = "ntkbz69w"
        let urlString = "https://mailosaur.com/api/messages/search?server=\(server)"
        let username = "dAj8DCycDKvsHJc"   //API KEY
        let password = "jekzeb-sorvEh-3cejsa"
        let loginString = "\(username):\(password)"
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        
        guard let url = URL(string: urlString),
            let payload = "{\"sentTo\": \"\(email)\"}".data(using: .utf8) else {
            print("No payload")
            completionHandler("")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = payload
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            var stringcode: String?
            
            guard error == nil else {
                print(error!.localizedDescription)
                completionHandler(stringcode)
                return
            }
            guard let data = data else {
                print("Empty data")
                completionHandler(stringcode)
                return
            }
            
            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
                print("Wrong data format")
                completionHandler(stringcode)
                return
            }
            
            guard let dictionary = json as? [String: Any], let itemsArray = dictionary["items"] as? [Any], let latestEmail = itemsArray.first as? [String: Any], let subject = latestEmail["subject"] as? String, let regex = try? NSRegularExpression(pattern: "[012345679abcdfghjkmnpqrstvwxyzCDFGHJKLMNPQRSTVWXYZ]{4}", options: .caseInsensitive) else {
               
                print("Something went wrong")
                completionHandler(stringcode)
                return
            }
            
            let string = subject as NSString
            let codeList = regex.matches(in: subject, options: [], range: NSRange(location: 0, length: string.length)).map {
                string.substring(with: $0.range).replacingOccurrences(of: "#", with: "").lowercased()
            }
            
            stringcode = codeList.first.map {
                String($0)
            }

            completionHandler(stringcode)
        }
        .resume()
    }
    // MARK: - ResetPasswordTests
    
    func userEntersLogInDetailsForResetTest1st () {
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.textFields["name@domain.com"].tap()
        elementsQuery.textFields["name@domain.com"].typeText(resetUser)
        elementsQuery.secureTextFields["Password"].tap()
        elementsQuery.secureTextFields["Password"].typeText("!Testtest123")
           
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .button)["Log in"].tap()
    }
       
    func userEntersEmailWrongPasswordAndReqCode () {
        let elementsQuery = app.scrollViews.otherElements
        elementsQuery.textFields["name@domain.com"].tap()
        elementsQuery.textFields["name@domain.com"].typeText(resetUser)
        elementsQuery.secureTextFields["Password"].tap()
        elementsQuery.secureTextFields["Password"].typeText("NotThePassword")
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .button)["Log in"].tap()
        sleep(2)
        app.alerts["Error!"].scrollViews.otherElements.buttons["OK"].tap()
        app.scrollViews.otherElements.buttons["Need help?"].tap()
        app.sheets["Need help to login?"].scrollViews.otherElements.buttons["Reset password"].tap()
        sleep(8)
        app.alerts.scrollViews.otherElements.buttons["OK"].tap()
    }
       
    func confirmPasswordResetScreenIsPresent () {
        XCTAssert(app.scrollViews.otherElements.staticTexts["Confirm password reset"].exists)
    }
    
    func enterIncorrectCode () {
        let code = "zzzz"
        for char in code {
            app.keys[String(char)].tap()
        }
        app.buttons["Done"].tap()
        sleep(2)
        app.alerts["Error!"].scrollViews.otherElements.buttons["OK"].tap()
    }
    
    func getMessageDetails(messageId: String, completionHandler:  @escaping ((_ code: [String]) -> Void)) {
        let urlString = "https://mailosaur.com/api/messages/\(messageId)"
        let username = "dAj8DCycDKvsHJc"   //API KEY
        let loginString = String(format: "%@", username)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()

        guard let url = URL(string: urlString) else
        {
            completionHandler([])
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            var codeArray = [String]()
            guard error == nil else {
                print(error!.localizedDescription);
                completionHandler(codeArray)
                return
            }
            guard let data = data else {
                print("Empty data");
                completionHandler(codeArray)
                return
            }

            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else{return}

            if let dictionary = json as? [String: Any] {
                if let itemsArray = dictionary["text"] as? [String: Any] {
                    if let itemBody = itemsArray["body"] as? String {
                        //print(itemBody)
                        if let regex = try? NSRegularExpression(pattern: "\\s[012345679abcdfghjkmnpqrstvwxyzCDFGHJKLMNPQRSTVWXYZ]{4}\\s", options: .caseInsensitive)
                        {
                            let string = itemBody as NSString

                            codeArray = regex.matches(in: itemBody, options: [], range: NSRange(location: 0, length: string.length)).map {
                                string.substring(with: $0.range).replacingOccurrences(of: "#", with: "")
                            }
                        }
                    }
                }
            }
            completionHandler(codeArray)
        }
        .resume()
    }
    
    func enterNewPassword() {
        app.secureTextFields["Make it secure"].typeText("testtest")
        app.children(matching: .window).element(boundBy: 0).buttons["Continue"].tap()
        sleep(2)
        app.alerts.scrollViews.otherElements.buttons["OK"].tap()
        sleep(2)
    }

    func getResetPasswordCode(email: String, completionHandler:  @escaping ((_ code: [String]) -> Void)) {
        let server = "ntkbz69w"
        let urlString = "https://mailosaur.com/api/messages/search?server=\(server)"
        let username = "dAj8DCycDKvsHJc"   //API KEY
        let password = "jekzeb-sorvEh-3cejsa"
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()

        guard let url = URL(string: urlString),
            let payload = "{\"sentTo\": \"\(email)\"}".data(using: .utf8) else
        {
            completionHandler([])
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = payload

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let codeArray = [String]()
            guard error == nil else {
                print(error!.localizedDescription);
                completionHandler(codeArray)
                return
            }
            guard let data = data else {
                print("Empty data");
                completionHandler(codeArray)
                return
            }

            guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else{return}

            if let dictionary = json as? [String: Any] {
                if let itemsArray = dictionary["items"] as? [Any], itemsArray.count > 0 {
                    if let latestEmail = itemsArray[0] as? [String: Any] {
                        if let messageId = latestEmail["id"] as? String {
                            self.getMessageDetails(messageId: messageId, completionHandler: { (code) in
                                completionHandler(code)
                            })
                        }
                    }
                }
            }
        }
        .resume()
    }
    
    func enterResetPasswordCode(code: String) {
        let lowerCase = CharacterSet.lowercaseLetters
        let upperCase = CharacterSet.uppercaseLetters
        for char in code.unicodeScalars {
            sleep(1)
            if lowerCase.contains(char) {
                app.keys[String(char)].tap()
                sleep(1)
            } else if upperCase.contains(char) {
                app.buttons["shift"].tap()
                sleep(1)
                app.keys[String(char)].tap()
            } else {
                app.keys["more"].tap()
                sleep(1)
                app.keys[String(char)].tap()
                sleep(1)
                app.keys["more"].tap()
            }
        }
        app.children(matching: .window).element(boundBy: 0).buttons["Done"].tap()
        sleep(5)
    }
    
    func resetPasswordScreenIsPresent() {
        XCTAssert(app.secureTextFields["Make it secure"].exists)
    }
    
    func checkResetConfirmEmail(email: String) {
        let server = "ntkbz69w"
        let urlString = "https://mailosaur.com/api/messages/search?server=\(server)"
        let username = "dAj8DCycDKvsHJc"
        let password = "jekzeb-sorvEh-3cejsa"
        let loginString = "\(username):\(password)"
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        sleep(10)
    
        guard let url = URL(string: urlString),
            let payload = "{\"sentTo\": \"\(email)\"}".data(using: .utf8) else {
            print("No payload")
            return
        }
    
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = payload
    
        URLSession.shared.dataTask(with: request) { (data, response, error) in
    
        guard error == nil else {
            print(error!.localizedDescription)
           // completionHandler(stringcode)
            return
        }
            
        guard let data = data else {
            print("Empty data")
            return
        }
        
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
            print("Wrong data format")
            return
        }
        
        guard let dictionary = json as? [String: Any], let itemsArray = dictionary["items"] as? [Any], let latestEmail = itemsArray.first as? [String: Any], let subject = latestEmail["subject"] as? String, let regex = try? NSRegularExpression(pattern: "Your mobile ticket account password has been reset", options: .caseInsensitive) else {
           
            print("Something went wrong")
            return
        }
        
        let string = subject as NSString
        let codeList = regex.matches(in: subject, options: [], range: NSRange(location: 0, length: string.length)).map {
            string.substring(with: $0.range)
        }

        if codeList == [] {
                XCTFail("No code found")
        } else {
            print("Code found")
            }
        }
    .resume()
    }

    func getPasswordFromDate () -> String {
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "yyyymmddhhmmss"
        let formattedDate = format.string(from: date)
        return formattedDate
    }
    
    func tapContinueResetPwd() {
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .button)["Continue"].tap()
        sleep(3)
        app.alerts.scrollViews.otherElements.buttons["OK"].tap()
        sleep(5)
    }
}
    // MARK: - Unused
//    func addCard4111 () {
//            let scrollViewsQuery = app.scrollViews
//            let element = scrollViewsQuery.children(matching: .other).element.children(matching: .other).element
//
//            element.typeText("card 1")
//
//            let textField = element.children(matching: .other).element(boundBy: 4).children(matching: .textField).element
//            textField.tap()
//
//            textField.typeText("4111111111111111")
//
//            let elementsQuery = scrollViewsQuery.otherElements
//            let textField2 = element.children(matching: .other).element(boundBy: 6).children(matching: .other).element(boundBy: 0).children(matching: .textField).element
//            textField2.tap()
//
//            textField2.typeText("123")
//
//            elementsQuery.textFields["MM/YY"].tap()
//            elementsQuery.pickerWheels["2020"].adjust(toPickerWheelValue: "2021")
//            elementsQuery.pickerWheels["February"].adjust(toPickerWheelValue: "January")
//
//            let continueButton = app.buttons["Continue"]
//            continueButton.tap()
//
//            let streetTextField = element.children(matching: .other).element(boundBy: 2).textFields["Street"]
//            streetTextField.tap()
//            streetTextField.typeText("Qwerty")
//
//            let townTextField = elementsQuery.textFields["Town"]
//            townTextField.tap()
//            townTextField.typeText("Asdfg")
//
//            app.children(matching: .window).element(boundBy: 0).buttons["Next"].tap()
//        }
//
//        func deleteCard1(){
//            let tablesQuery = app.tables
//            tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["4111 11•• •••• 1111"]/*[[".cells.staticTexts[\"4111 11•• •••• 1111\"]",".staticTexts[\"4111 11•• •••• 1111\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//            app.navigationBars["Payment methods"].buttons["Edit"].tap()
//            tablesQuery/*@START_MENU_TOKEN@*/.buttons["Delete 4111 11•• •••• 1111"]/*[[".cells.buttons[\"Delete 4111 11•• •••• 1111\"]",".buttons[\"Delete 4111 11•• •••• 1111\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//            tablesQuery.buttons["Delete"].tap()
//        }
//
//
//        func donnotAllowLocPermOnLaunch() {
//          app.buttons["Not now"].tap()
//        }

