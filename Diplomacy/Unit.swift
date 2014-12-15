//
//  Unit.swift
//  Diplomacy
//
//  Created by Matthew Stephens on 12/14/14.
//  Copyright (c) 2014 MattStephens. All rights reserved.
//

import Foundation
import CoreData

class Unit: NSManagedObject {

    @NSManaged var acl: AnyObject
    @NSManaged var createdAt: NSDate
    @NSManaged var objectId: String
    @NSManaged var type: String
    @NSManaged var updatedAt: NSDate
    @NSManaged var boardId: String
    @NSManaged var location: String
    @NSManaged var country: String
    
    func initWithObject (object : PFObject) {
        acl = object.ACL
        createdAt = object.createdAt
        objectId = object.objectId
        type = object["type"] as String
        updatedAt = object.updatedAt
        boardId = object["board"] as String
        location = object["location"] as String
        country = object["country"] as String
    }
}
