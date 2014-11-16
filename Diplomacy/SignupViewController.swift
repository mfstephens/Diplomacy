//
//  SignupViewController.swift
//  Diplomacy
//
//  Created by Matthew Stephens on 11/11/14.
//  Copyright (c) 2014 MattStephens. All rights reserved.
//

import Foundation

class SignupViewController : UIViewController, UITextFieldDelegate, UIAlertViewDelegate {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordAgainField: UITextField!
    
    @IBAction func createAccountPressed(sender: AnyObject) {
        self.view.endEditing(true)
        self.processFieldEntries()
    }
    
    @IBAction func cancelPressed(sender: AnyObject) {
        self.view.endEditing(true)
        self.processFieldEntries()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        usernameField.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if (textField == usernameField) {
            passwordField.becomeFirstResponder()
        }
        else if (textField == passwordField) {
            passwordAgainField.becomeFirstResponder()
        }
        else if (textField == passwordAgainField) {
            passwordAgainField.resignFirstResponder()
//            self.processFieldEntries()
        }
        
        return true
    }
    
    func processFieldEntries() {
        var username = usernameField.text
        var password = passwordField.text
        var passwordAgain = passwordAgainField.text
        var errorText = "Please "
        var usernameBlankText = "enter a username"
        var passwordBlankText = "enter a password"
        var joinText = ", and "
        var passwordMistmatchText = "enter the same password twice"
        
        var textError = false
        
        var usernameLength = countElements(username)
        var passwordLength = countElements(password)
        var passwordAgainLength = countElements(passwordAgain)
        
        
        // comparing to 0 will check for nil text
        if (usernameLength == 0 || passwordLength == 0 || passwordAgainLength == 0) {
            textError = true
            
            if (usernameLength == 0) {
                usernameField.becomeFirstResponder()
            }
            if (passwordLength == 0) {
                passwordField.becomeFirstResponder()
            }
            if (passwordAgainLength == 0) {
                passwordAgainField.becomeFirstResponder()
            }
            
            if (usernameLength == 0) {
                errorText = errorText.stringByAppendingString(usernameBlankText)
            }
            
            if (passwordLength == 0 || passwordAgainLength == 0) {
                if (usernameLength == 0) {
                    errorText = errorText.stringByAppendingString(joinText)
                }
                errorText = errorText.stringByAppendingString(passwordBlankText)
            }
        } else if (password != passwordAgain) {
            textError = true
            errorText = errorText.stringByAppendingString(passwordMistmatchText)
            passwordField.becomeFirstResponder()
        }
        
        if (textError) {
            let alertView = UIAlertView(title: errorText, message: nil, delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
            return
        }
        
        // attempt to login
        var user = PFUser()
        user.username = username
        user.password = password
        user.signUpInBackgroundWithBlock { (succeeded: Bool!, error: NSError!) -> Void in
            if (error != nil) {
                var errorText: AnyObject? = error.userInfo!["error"]
//                let alertView = UIAlertView(title: errorText, message: nil, delegate: nil, cancelButtonTitle: "OK")
                println(errorText)
                self.usernameField.becomeFirstResponder()
                return;
            }
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
