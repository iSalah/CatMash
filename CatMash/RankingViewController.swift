//
//  RankingViewController.swift
//  CatMash
//
//  Created by Salah on 28/09/2017.
//  Copyright © 2017 Salah. All rights reserved.
//

import Foundation
import UIKit

class RankingViewController: DrawableMenuViewController, UITableViewDelegate, UITableViewDataSource {
    
    static let identifier = "RankingViewController"
    
    @IBOutlet weak var tableView: UITableView!
    var cats = [Cat]()
    var selectedCat: Cat?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "showCatSegue" {
            let vc = segue.destination as! CatViewController
            vc.cat = selectedCat
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.cats = Cat.allCats.sorted(by: {$0.0.score > $0.1.score})
        self.tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cat = cats[indexPath.row]
        let rank = indexPath.row + 1
        let cell = tableView.dequeueReusableCell(withIdentifier: CatCell.identifier) as! CatCell
        cell.configCell(withCat: cat, rank: rank)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedCat = cats[indexPath.row]
        self.performSegue(withIdentifier: "showCatSegue", sender: nil)
    }

}
