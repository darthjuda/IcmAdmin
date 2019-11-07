//
//  AlertService.swift
//  IcmAdmin
//
//  Created by mehdi jung on 30/10/2019.
//  Copyright © 2019 mehdi jung. All rights reserved.
//

import Foundation
import UIKit


class AlertService {
    func alert(message: String) -> UIAlertController {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
        
        alert.addAction(action)
        
        return alert
    }
}
