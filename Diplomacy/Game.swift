//
//  Diplomacy.swift
//  Diplomacy
//
//  Created by Matthew Stephens on 12/13/14.
//  Copyright (c) 2014 MattStephens. All rights reserved.
//

import Foundation
import CoreData

class Game: NSManagedObject {

    @NSManaged var acl: AnyObject
    @NSManaged var createdAt: NSDate
    @NSManaged var isPrivate: NSNumber
    @NSManaged var name: String
    @NSManaged var numberOfPlayers: NSNumber
    @NSManaged var objectId: String
    @NSManaged var owner: AnyObject
    @NSManaged var players: AnyObject
    @NSManaged var status: String
    @NSManaged var turnNumber: NSNumber
    @NSManaged var updatedAt: NSDate
    @NSManaged var winner: AnyObject
    @NSManaged var board: Diplomacy.Board
    @NSManaged var playersAsCountries: Int
    
    func initFromObject(object : PFObject) {
        acl = object.ACL
        createdAt = object.createdAt
        numberOfPlayers = object["numberOfPlayers"] as NSNumber
        objectId = object.objectId
        owner = object["owner"]
        players = object["players"]
        isPrivate = object["isPrivate"] as Bool
        status = object["status"] as String
        turnNumber = object["turnNumber"] as NSNumber
        updatedAt = object.updatedAt
        winner = "placeholder" as String
        name = object["name"] as NSString
        getGameBoard(object["board"].objectId as String)
    }
    
    func getGameBoard(boardId : String) {
        var query = PFQuery(className:"Board")
        query.whereKey("objectId", equalTo: boardId)
        var gameBoard = PFObject(className:"Board")
        let entityDescripition = NSEntityDescription.entityForName("Board", inManagedObjectContext: self.managedObjectContext!)
        query.findObjectsInBackgroundWithBlock {
            (objects: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                let tempBoard = Board(entity: entityDescripition!, insertIntoManagedObjectContext: nil)
                if (objects.count != 0) {
                    tempBoard.initFromObject(objects[0] as PFObject)
                    self.board = tempBoard
                    NSNotificationCenter.defaultCenter().postNotificationName("foundBoard", object: nil)
                } else {
                    println("board not found")
                }
            } else {
                // Log details of the failure
                NSLog("Error: %@ %@", error, error.userInfo!)
            }
        }
    }


}
