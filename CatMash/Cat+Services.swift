//
//  Cat+Services.swift
//  CatMash
//
//  Created by Salah on 27/09/2017.
//  Copyright © 2017 Salah. All rights reserved.
//

import Foundation
import Alamofire

extension Cat {
    
    class func fetchCats(callback: @escaping ([Cat])->()) {
        Alamofire.request("https://latelier.co/data/cats.json").responseJSON { response in
            guard let json = response.result.value as? NSDictionary else { return callback([]) }
            guard let jsonCats = json.object(forKey: "images") as? NSArray else { return callback([])}
            var cats = [Cat]()
            for jsonCat in jsonCats {
                if let catDict = jsonCat as? NSDictionary, let cat = Cat(fromDictionary: catDict) {
                    cats.append(cat)
                }
            }
            callback(cats)
        }
    }
    
}
