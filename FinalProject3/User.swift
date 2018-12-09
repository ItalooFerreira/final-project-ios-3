//
//  User.swift
//  FinalProject3
//
//  Created by Ítalo Ferreira on 09/12/18.
//  Copyright © 2018 Ítalo Ferreira. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: String?
    var username: String?
    var email: String?
    var quotes = [String]()
}
