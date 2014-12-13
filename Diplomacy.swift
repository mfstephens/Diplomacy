//
//  Diplomacy.swift
//  Diplomacy
//
//  Created by Matthew Stephens on 12/13/14.
//  Copyright (c) 2014 MattStephens. All rights reserved.
//

import Foundation
import CoreData

class Diplomacy: NSManagedObject {

    @NSManaged var acl: AnyObject
    @NSManaged var createdAt: NSDate
    @NSManaged var objectId: String
    @NSManaged var updatedAt: NSDate
    @NSManaged var game: 
    @NSManaged var provinces: NSSet
    @NSManaged var units: NSSet

}
