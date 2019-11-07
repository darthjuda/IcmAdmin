//
//  TabBarController.swift
//  IcmAdmin
//
//  Created by mehdi jung on 29/10/2019.
//  Copyright © 2019 mehdi jung. All rights reserved.
//

import Foundation
import UIKit


class TabBarController: UITabBarController {
    
    var user: User?
    
    override func viewDidLoad() {
        UITabBar.appearance().barTintColor = .black
        UITabBar.appearance().tintColor = .red
    }
    
    
}
