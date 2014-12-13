//
//  Diplomacy.swift
//  Diplomacy
//
//  Created by Matthew Stephens on 12/13/14.
//  Copyright (c) 2014 MattStephens. All rights reserved.
//

import Foundation
import CoreData

class Board: NSManagedObject {

    @NSManaged var acl: AnyObject
    @NSManaged var createdAt: NSDate
    @NSManaged var objectId: String
    @NSManaged var updatedAt: NSDate
    @NSManaged var gameId: String
    @NSManaged var provinces: NSSet
    @NSManaged var units: NSSet
    
    func initFromObject(object : PFObject) {
        acl = object.ACL
        println(object)
        createdAt = object.createdAt
        objectId = object.objectId
        updatedAt = object.updatedAt
        gameId = object["game"] as String
        provinces = NSSet()
        units = NSSet()
    }

}
