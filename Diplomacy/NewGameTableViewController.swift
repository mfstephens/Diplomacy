//
//  NewGameViewController.swift
//  Diplomacy
//
//  Created by Matthew Stephens on 11/27/14.
//  Copyright (c) 2014 MattStephens. All rights reserved.
//

import Foundation
import CoreData

class NewGameTableViewController : UITableViewController {
    @IBOutlet weak var gameNameField: UITextField!
    @IBOutlet weak var privateGameSwitch: UISwitch!
    @IBAction func didPressCancel(sender: UIBarButtonItem) {
        navigationController?.popToRootViewControllerAnimated(true)
    }
    @IBAction func didPressDone(sender: AnyObject) {
        var isPrivate = privateGameSwitch.on
        var name = gameNameField.text
        
        var board = PFObject(className: "Board")
        var game = PFObject(className: "Game")
        var unit = PFObject(className: "Unit")
        
        unit["type"] = "Artillery"
        unit["location"] = "Liverpool"
        
        board["units"] = [unit]
        
        game["isPrivate"] = isPrivate
        game["name"] = name
        game["numberOfPlayers"] = 1
        game["turnNumber"] = 0
        game["owner"] = PFUser.currentUser()
        game["players"] = [PFUser.currentUser()]
        game["status"] = "Not started"
        game["board"] = board

        game.saveInBackgroundWithBlock { (success : Bool, error : NSError!) -> Void in
            if (success) {
                self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
            }
            else {
                let alert = UIAlertView(title: "Failed", message: "Game failed to send!", delegate: nil, cancelButtonTitle: "OK")
                alert.show()
            }
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    

}
