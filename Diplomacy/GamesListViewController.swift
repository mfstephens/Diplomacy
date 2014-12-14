//
//  GamesListViewController.swift
//  Diplomacy
//
//  Created by Matthew Stephens on 11/12/14.
//  Copyright (c) 2014 MattStephens. All rights reserved.
//

import Foundation
import CoreData

class GamesListViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext
 
    var gamesList = [Game]()
    var selectedGame : Game!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllGames()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gamesList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:GamesListTableCell? = self.tableView.dequeueReusableCellWithIdentifier("GamesListTableCell") as? GamesListTableCell
        var gameName = gamesList[indexPath.row].name as String
        var numberOfPlayers = gamesList[indexPath.row].numberOfPlayers as NSNumber
        var turnNumber = gamesList[indexPath.row].turnNumber as NSNumber
        cell?.loadCell(gameName, numberOfPlayers: numberOfPlayers.stringValue, turnNumber: turnNumber.stringValue)
        return cell!
    }
    
    func getAllGames() {
        var query = PFQuery(className:"Game")
        var results = [PFObject]()
        let entityDescripition = NSEntityDescription.entityForName("Game", inManagedObjectContext: self.managedObjectContext!)
        
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                // The find succeeded.
                // Do something with the found objects
                for object in objects {
                    let game = Game(entity: entityDescripition!, insertIntoManagedObjectContext: self.managedObjectContext)
                    game.initFromObject(object as PFObject)
                    self.gamesList.append(game)
                }
                
                self.tableView.reloadData()
            } else {
                // Log details of the failure
                NSLog("Error: %@ %@", error, error.userInfo!)
            }
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selectedGame = gamesList[indexPath.row]
        performSegueWithIdentifier("viewGameSegue", sender: indexPath)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.description == "viewGameSegue") {
            let gameScreen : GameScreenViewController = segue.destinationViewController as GameScreenViewController
            gameScreen.game = selectedGame
            println(gameScreen.game)
        }
    }
    
}
