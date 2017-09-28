//
//  CatCell.swift
//  CatMash
//
//  Created by Salah on 28/09/2017.
//  Copyright © 2017 Salah. All rights reserved.
//

import Foundation
import UIKit

class CatCell: UITableViewCell {
    
    static let identifier = "catCellIdentifier"
    
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!

    func configCell(withCat cat: Cat, rank: Int) {
        self.catImage.sd_setImage(with: URL(string: cat.url), completed: nil)
        self.scoreLabel.text = "\(rank) - \(cat.score) point\(cat.score > 1 ? "s" : "")"
    }
    
}
