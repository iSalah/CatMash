//
//  CatViewController.swift
//  CatMash
//
//  Created by Salah on 28/09/2017.
//  Copyright © 2017 Salah. All rights reserved.
//

import UIKit
import SDWebImage

class CatViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var cat: Cat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let cat = cat {
            imageView.sd_setImage(with: URL(string: cat.url), completed: nil)
        }
    }
    
}
