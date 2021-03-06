//
//  GameListTableCell.swift
//  Diplomacy
//
//  Created by Matthew Stephens on 11/26/14.
//  Copyright (c) 2014 MattStephens. All rights reserved.
//

import Foundation

class GamesListTableCell : UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberOfPlayersLabel: UILabel!
    @IBOutlet weak var turnNumberLabel: UILabel!
    @IBOutlet weak var privateLabel: UILabel!

    func loadCell(name : String, numberOfPlayers : String, turnNumber : String, isPrivate : Bool) {
        nameLabel.text = name
        numberOfPlayersLabel.text = numberOfPlayers
        turnNumberLabel.text = turnNumber
        
        if (isPrivate) {
            privateLabel.text = "Yes"
        } else {
            privateLabel.text = "No"
        }
    }
}
