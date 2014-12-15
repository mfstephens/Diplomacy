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
    @NSManaged var units: Array<Diplomacy.Unit>
    
    func initFromObject(object : PFObject) {
        acl = object.ACL
        createdAt = object.createdAt
        objectId = object.objectId
        updatedAt = object.updatedAt
        units = object["units"] as Array
    }

}
