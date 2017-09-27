//
//  MenuItem.swift
//  CatMash
//
//  Created by Salah on 27/09/2017.
//  Copyright © 2017 Salah. All rights reserved.
//

import Foundation
import UIKit

enum MenuItem {
    case vote
    case ranking
    
    var title: String {
        switch self {
        case .vote: return "Vote"
        case .ranking: return "Ranking"
        }
    }
    
    var viewController: UIViewController? {
        switch self {
        case .vote:
            let storyboard = UIStoryboard(name: "Vote", bundle: nil)
            return storyboard.instantiateViewController(withIdentifier: VoteViewController.identifier)
        case .ranking:
            return nil
        }
    }
}
