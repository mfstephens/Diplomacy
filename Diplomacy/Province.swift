//
//  Province.swift
//  Diplomacy
//
//  Created by Matthew Stephens on 12/14/14.
//  Copyright (c) 2014 MattStephens. All rights reserved.
//

import Foundation
import CoreData

class Province: NSManagedObject {

    @NSManaged var abbreviation: String
    @NSManaged var acl: AnyObject
    @NSManaged var createdAt: NSDate
    @NSManaged var isSupplyCenter: NSNumber
    @NSManaged var objectId: String
    @NSManaged var type: String
    @NSManaged var updatedAt: NSDate
    @NSManaged var unitId: String
    @NSManaged var boardId: String

}
