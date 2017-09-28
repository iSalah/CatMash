//
//  CatEntity+CoreDataProperties.swift
//  CatMash
//
//  Created by Salah on 27/09/2017.
//  Copyright © 2017 Salah. All rights reserved.
//
//

import Foundation
import CoreData


extension CatEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CatEntity> {
        return NSFetchRequest<CatEntity>(entityName: "CatEntity")
    }

    @NSManaged public var id: String?
    @NSManaged public var score: Int32
    @NSManaged public var url: String?

}
