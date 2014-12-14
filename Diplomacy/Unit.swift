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
    @NSManaged var location: NSManagedObject
    
    func initWithObject (object : PFObject) {
        
    }
}
