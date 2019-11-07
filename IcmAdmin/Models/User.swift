//
//  User.swift
//  IcmAdmin
//
//  Created by mehdi jung on 29/10/2019.
//  Copyright © 2019 mehdi jung. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: Int
    var username: String
    var name: String
    var forename: String
    var phoneNumber: String
    var birthdate: Int
    
    var isPro: Bool
    var siret: String
}
