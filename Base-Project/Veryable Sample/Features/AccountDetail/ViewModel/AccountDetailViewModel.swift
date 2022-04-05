//
//  AccountDetailViewModel.swift
//  Veryable Sample
//
//  Created by Mahender Reddy Gaddam on 4/3/22.
//  Copyright © 2022 Veryable Inc. All rights reserved.
//

import Foundation

protocol AccountDetailViewModelProtocol {
    var imageName: String? { get }
    var accountName: String? { get }
    var description: String? { get }
}

class AccountDetailViewModel: AccountDetailViewModelProtocol {
    private var account: Account?
    
    init(account: Account?) {
        self.account = account
    }
    
    var imageName: String? {
        return account?.accountType
    }
    
    var accountName: String? {
        return account?.accountName
    }
    
    var description: String? {
        return account?.description
    }
}
