//
//  MenuViewController.swift
//  CatMash
//
//  Created by Salah on 27/09/2017.
//  Copyright © 2017 Salah. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UITableViewController {
    
    let menuItems = [MenuItem.vote, MenuItem.ranking]
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let menuItem = menuItems[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.identifier) as! MenuCell
        cell.configCell(withItem: menuItem)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuItem = menuItems[indexPath.row]
        if let vc = menuItem.viewController {
            self.evo_drawerController?.setCenter(UINavigationController(rootViewController: vc), withCloseAnimation: true, completion: nil)
        }
    }
    
}
