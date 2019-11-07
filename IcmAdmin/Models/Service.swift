//
//  Service.swift
//  IcmAdmin
//
//  Created by mehdi jung on 27/10/2019.
//  Copyright © 2019 mehdi jung. All rights reserved.
//

import Foundation

struct Service: Codable {
    var id: Int
    var name: String
    var description: String
    var category: String?
    var price: Int
    
}
