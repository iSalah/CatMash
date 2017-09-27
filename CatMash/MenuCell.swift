//
//  MenuCell.swift
//  CatMash
//
//  Created by Salah on 27/09/2017.
//  Copyright © 2017 Salah. All rights reserved.
//

import Foundation
import UIKit

class MenuCell: UITableViewCell {
    
    static let identifier = "menuCellIdentifier"
    
    @IBOutlet weak var title: UILabel!

    func configCell(withItem item: MenuItem) {
        self.title.text = item.title
    }
    
}
