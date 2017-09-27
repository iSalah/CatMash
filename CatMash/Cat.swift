//
//  Cat.swift
//  CatMash
//
//  Created by Salah on 27/09/2017.
//  Copyright © 2017 Salah. All rights reserved.
//

import Foundation
import CoreData

class Cat {
    static let entityName = "CatEntity"
    static let defaultScore = 1000
    
    var id: String
    var url: String
    var score: Int
    
    init?(fromDictionary dict: NSDictionary) {
        guard let id = dict.value(forKey: "id") as? String else { return nil }
        guard let url = dict.value(forKey: "url") as? String else { return nil }
        let score = dict.value(forKey: "score") as? Int ?? Cat.defaultScore
        self.id = id
        self.url = url
        self.score = score
    }
    
    init?(fromEntity entity: CatEntity) {
        guard let id = entity.id else { return nil }
        guard let url = entity.url else { return nil }
        self.id = id
        self.url = url
        self.score = NSNumber(value: entity.score).intValue
    }
}
