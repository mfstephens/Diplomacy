//
//  Diplomacy.swift
//  Pods
//
//  Created by Matthew Stephens on 12/13/14.
//
//

import Foundation
import CoreData

class Diplomacy: NSManagedObject {

    @NSManaged var acl: AnyObject
    @NSManaged var createdAt: NSDate
    @NSManaged var name: String
    @NSManaged var numberOfPlayers: NSNumber
    @NSManaged var objectId: String
    @NSManaged var owner: AnyObject
    @NSManaged var players: AnyObject
    @NSManaged var isPrivate: NSNumber
    @NSManaged var status: String
    @NSManaged var turnNumber: NSNumber
    @NSManaged var updatedAt: NSDate
    @NSManaged var winner: AnyObject
    @NSManaged var board: Board

}
