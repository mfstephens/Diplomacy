//
//  LoginViewController.swift
//  Diplomacy
//
//  Created by Matthew Stephens on 10/15/14.
//  Copyright (c) 2014 MattStephens. All rights reserved.
//

import Foundation

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var username: NSString!
    var password: NSString!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        usernameField.becomeFirstResponder()
    }

    
    @IBAction func pressedLoginButton(sender: AnyObject) {
        self.view.endEditing(true)
        self.processFieldEntries()
    }
    
    func processFieldEntries() {
        var username = self.usernameField.text
        var password = self.passwordField.text
        var noUsernameText = "username"
        var noPasswordText = "password"
        var errorText = "No "
        var errorTextJoin = " or "
        var errorTextHandling = " entered"
        var textError = false
        var usernameLength = countElements(username)
        var passwordLength = countElements(password)
        
        if (usernameLength == 0 || passwordLength == 0) {
            textError = true
            
            if (passwordLength == 0) {
                passwordField.becomeFirstResponder()
            }
            if (usernameLength == 0) {
                usernameField.becomeFirstResponder()
            }
        }
        
        if (textError) {
            let alertView = UIAlertView(title: errorText, message: nil, delegate: nil, cancelButtonTitle: "OK")
            alertView.show()
            return
        }
        
        PFUser.logInWithUsernameInBackground(username, password: password, block: {
            (user, error) -> Void in

            if (user != nil) {
                // got a user
                println("found user")
                self.performSegueWithIdentifier("didLoginSegue", sender: nil)
            } else {
                // no user
                var errorText: AnyObject? = error.userInfo!["error"]
                println(errorText)
            }
            
        })
    }
    
//    func textFieldDidEndEditing(textField: UITextField) {
//        if (textField == usernameField) {
//            username = textField.text
//        }
//        if (textField == passwordField) {
//            password = textField.text
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}