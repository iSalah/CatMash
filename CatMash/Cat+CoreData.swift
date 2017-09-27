//
//  Cat+CoreData.swift
//  CatMash
//
//  Created by Salah on 27/09/2017.
//  Copyright © 2017 Salah. All rights reserved.
//

import Foundation
import CoreData

extension Cat {
    
    class func save(cats: [Cat]) {
        for cat in cats {
            Cat.save(cat: cat)
        }
    }
    
    class func save(cat: Cat) {
        guard Cat.find(id: cat.id) == nil else { return }
        
        let entityDescription = NSEntityDescription.entity(forEntityName: Cat.entityName, in: ManagerCoreData.shared.managedContext)!
        let catEntity = CatEntity(entity: entityDescription, insertInto: ManagerCoreData.shared.managedContext)
        catEntity.id = cat.id
        catEntity.url = cat.url
        catEntity.score = NSNumber(value: Cat.defaultScore).int32Value
        print("Save Cat with identifier \(cat.id)")
        ManagerCoreData.shared.saveContext()
    }
    
    class func find(id: String) -> CatEntity? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Cat.entityName)
        request.predicate = NSPredicate(format: "id = \'\(id)\' ")
        request.fetchLimit = 1
        
        let result = try? ManagerCoreData.shared.managedContext.fetch(request)
        return result?.first as? CatEntity
    }
    
}
