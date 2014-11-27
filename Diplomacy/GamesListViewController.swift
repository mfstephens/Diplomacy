//
//  GamesListViewController.swift
//  Diplomacy
//
//  Created by Matthew Stephens on 11/12/14.
//  Copyright (c) 2014 MattStephens. All rights reserved.
//

import Foundation

class GamesListViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:GamesListTableCell? = tableView.dequeueReusableCellWithIdentifier("GamesListTableCell") as? GamesListTableCell
        var numberOfPlayers = 5
        var turnNumber = 4
        cell?.nameLabel.text = "game name"
        cell?.numberOfPlayersLabel.text = "Number of players: " + String(numberOfPlayers)
        cell?.turnNumberLabel.text = "Turn number: " + String(turnNumber)
        return cell!
    }
    
}
