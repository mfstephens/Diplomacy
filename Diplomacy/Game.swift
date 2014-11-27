//
//  Game.swift
//  Diplomacy
//
//  Created by Matthew Stephens on 10/15/14.
//  Copyright (c) 2014 MattStephens. All rights reserved.
//

import Foundation
import CoreData

class Game: NSManagedObject {

    @NSManaged var acl: AnyObject
    @NSManaged var createdAt: NSDate
    @NSManaged var numberOfPlayers: NSNumber
    @NSManaged var objectId: String
    @NSManaged var owner: AnyObject
    @NSManaged var players: AnyObject
    @NSManaged var publicOrPrivate: String
    @NSManaged var status: String
    @NSManaged var turnNumber: NSNumber
    @NSManaged var updatedAt: NSDate
    @NSManaged var winner: AnyObject
    @NSManaged var board: NSManagedObject
    @NSManaged var title: NSString
    
//    init (

}
