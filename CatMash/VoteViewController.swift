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
import SVProgressHUD

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
        if let mash = Cat.mash, mash.count == 2 {
            self.mash = mash
            SVProgressHUD.show()
            
            let asyncDownloadImageGroup = DispatchGroup()
            var asyncDownloadImageError: Error?
            asyncDownloadImageGroup.enter()
            
            cat1Button.isHidden = true
            cat1Button.sd_setImage(with: URL(string: mash.first!.url), for: .normal, completed: { (image, error, cacheType, url) in
                asyncDownloadImageError = error != nil ? error : asyncDownloadImageError
                asyncDownloadImageGroup.leave()
            })
            
            asyncDownloadImageGroup.enter()
            cat2Button.isHidden = true
            cat2Button.sd_setImage(with: URL(string: mash.last!.url), for: .normal, completed: { (image, error, cacheType, url) in
                asyncDownloadImageError = error != nil ? error : asyncDownloadImageError
                asyncDownloadImageGroup.leave()
            })
            
            asyncDownloadImageGroup.notify(queue: DispatchQueue.main, execute: {
                SVProgressHUD.dismiss()
                self.cat1Button.isHidden = false
                self.cat2Button.isHidden = false
                if asyncDownloadImageError != nil {
                    self.newMash()
                }
            })
        }
        else {
            cat1Button.setImage(nil, for: .normal)
            cat2Button.setImage(nil, for: .normal)
            self.mash = nil
        }
    }
    
    @IBAction func vote(_ sender: UIButton) {
        guard let mash = mash, mash.count == 2 else { return }
        let winnerCat = sender == cat1Button ? mash.first! : mash.last!
        let looserCat = sender == cat1Button ? mash.last! : mash.first!
        winnerCat.wins(against: looserCat)
        looserCat.loses(against: winnerCat)
        winnerCat.updateScore()
        looserCat.updateScore()
        newMash()
    }

}

