//
//  Account.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation

struct Account: Codable {
    let id: Int
    let accountType: String
    let accountName: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case accountType = "account_type"
        case accountName = "account_name"
        case description = "desc"
    }
}
