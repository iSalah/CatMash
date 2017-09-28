//
//  VoteViewController.swift
//  CatMash
//
//  Created by Salah on 27/09/2017.
//  Copyright © 2017 Salah. All rights reserved.
//

import UIKit
import DrawerController
import SDWebImage

class VoteViewController: DrawableMenuViewController {
    
    static let identifier = "VoteViewController"
    
    @IBOutlet weak var cat1Button: UIButton!
    @IBOutlet weak var cat2Button: UIButton!
    var mash: [Cat]?

    override func viewDidLoad() {
        super.viewDidLoad()
        Cat.fetchCats { cats in
            Cat.save(cats: cats)
            self.newMash()
        }
    }
    
    func newMash() {
        self.mash = Cat.mash
        guard mash != nil && mash!.count == 2 else { return }
        
        cat1Button.sd_setImage(with: URL(string: self.mash!.first!.url), for: .normal, completed: nil)
        cat2Button.sd_setImage(with: URL(string: self.mash!.last!.url), for: .normal, completed: nil)
    }

}

