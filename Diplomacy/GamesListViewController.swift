//
//  GamesListViewController.swift
//  Diplomacy
//
//  Created by Matthew Stephens on 11/12/14.
//  Copyright (c) 2014 MattStephens. All rights reserved.
//

import Foundation

class GamesListViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    var gamesList = [PFObject]()
    @IBOutlet weak var tableView: UITableView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        getAllGames()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gamesList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:GamesListTableCell? = self.tableView.dequeueReusableCellWithIdentifier("GamesListTableCell") as? GamesListTableCell
        println(gamesList[indexPath.row])
        var gameName = gamesList[indexPath.row]["name"] as String
        var numberOfPlayers = gamesList[indexPath.row]["numberOfPlayers"] as NSNumber
        var turnNumber = gamesList[indexPath.row]["turnNumber"] as NSNumber
        cell?.loadCell(gameName, numberOfPlayers: numberOfPlayers.stringValue, turnNumber: turnNumber.stringValue)
        return cell!
    }
    
    func getAllGames() {
        var query = PFQuery(className:"Game")
        var results = [PFObject]()
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                // The find succeeded.
                // Do something with the found objects
                for object in objects {
                    self.gamesList.append(object as PFObject)
                }
                self.tableView.reloadData()
            } else {
                // Log details of the failure
                NSLog("Error: %@ %@", error, error.userInfo!)
            }
        }
    }
    
}
