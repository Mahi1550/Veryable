//
//  AccountRepoMock.swift
//  Veryable SampleTests
//
//  Created by Mahender Reddy Gaddam on 4/5/22.
//  Copyright © 2022 Veryable Inc. All rights reserved.
//

import Foundation
@testable import Veryable_Sample

class AccountRepoMock: AccountRepoProtocol {
    var shouldFail = false
    
    public func getAccountList(completionHandler: @escaping ([Account]?, Bool) -> Void) {
        if shouldFail {
            completionHandler(nil, true)
        } else {
            completionHandler([Account(id: 1, accountType: "bank", accountName: "Chase Bank", description: "Checking"),
                               Account(id: 2, accountType: "card", accountName: "Chase Bank", description: "VISA")], false)
        }
    }
}
