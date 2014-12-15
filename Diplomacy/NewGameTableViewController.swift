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
        navigationController?.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func didPressDone(sender: AnyObject) {
        var isPrivate = privateGameSwitch.on
        var name = gameNameField.text
        
        var board = PFObject(className: "Board")
        var game = PFObject(className: "Game")
        
        var unit = PFObject(className: "Unit")
        var units = [PFObject]()
        
        unit["type"] = "Army"
        unit["location"] = "Vienna"
        unit["country"] = "Austria"
        units.append(unit)
        
        board["units"] = units
        
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
                NSNotificationCenter.defaultCenter().postNotificationName("newGameCreated", object: nil)
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
