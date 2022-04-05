//
//  AccountDetailViewModelTests.swift
//  Veryable SampleTests
//
//  Created by Mahender Reddy Gaddam on 4/5/22.
//  Copyright © 2022 Veryable Inc. All rights reserved.
//

import XCTest
@testable import Veryable_Sample

class AccountDetailViewModelTests: XCTestCase {
    var accountDetailViewModel: AccountDetailViewModelProtocol!
    let account = Account(id: 1, accountType: "bank", accountName: "Chase Bank", description: "Checking")
    
    override func setUpWithError() throws {
        accountDetailViewModel = AccountDetailViewModel(account: account)
    }

    override func tearDownWithError() throws {
        accountDetailViewModel = nil
    }
    
    func testImageNameShouldReturnBank() {
        XCTAssertEqual(accountDetailViewModel.imageName, "bank")
    }

    func testAccountNameShouldReturnChaseBank() {
        XCTAssertEqual(accountDetailViewModel.accountName, "Chase Bank")
    }

    func testNumberOfSectionsShouldReturnTwo() {
        XCTAssertEqual(accountDetailViewModel.description, "Checking")
    }
}
