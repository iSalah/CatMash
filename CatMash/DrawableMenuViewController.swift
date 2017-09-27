//
//  DrawableMenuViewController.swift
//  CatMash
//
//  Created by Salah on 27/09/2017.
//  Copyright © 2017 Salah. All rights reserved.
//

import Foundation
import DrawerController

class DrawableMenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMenuButton()
    }
    
    func setupMenuButton() {
        let drawerButton = DrawerBarButtonItem(target: self, action: #selector(drawerButtonPress(_:)))
        self.navigationItem.setLeftBarButton(drawerButton, animated: true)
    }
    
    func drawerButtonPress(_ sender: AnyObject?) {
        self.evo_drawerController?.toggleDrawerSide(.left, animated: true, completion: nil)
    }
    
}
