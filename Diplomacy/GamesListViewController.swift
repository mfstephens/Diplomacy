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
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "getAllGames", name: "newGameCreated", object: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gamesList.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 112
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:GamesListTableCell? = self.tableView.dequeueReusableCellWithIdentifier("GamesListTableCell") as? GamesListTableCell
        var gameName = gamesList[indexPath.row].name as String
        var numberOfPlayers = gamesList[indexPath.row].numberOfPlayers as NSNumber
        var turnNumber = gamesList[indexPath.row].turnNumber as NSNumber
        var isPrivate = gamesList[indexPath.row].isPrivate as Bool
        cell?.loadCell(gameName, numberOfPlayers: numberOfPlayers.stringValue, turnNumber: turnNumber.stringValue, isPrivate: isPrivate)
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
                    
                    var shouldInsert = true
                    for g in self.gamesList {
                        if (g.objectId == object.objectId as String) {
                            shouldInsert = false
                        }
                    }
                    
                    if (shouldInsert) {
                        self.gamesList.append(game)
                    }
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
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        performSegueWithIdentifier("viewGameLobbySegue", sender: indexPath)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "viewGameSegue") {
            let gameScreen : GameScreenViewController = segue.destinationViewController as GameScreenViewController
            gameScreen.game = selectedGame
        } else {
            println("game lobby")
        }
    }
    
}
