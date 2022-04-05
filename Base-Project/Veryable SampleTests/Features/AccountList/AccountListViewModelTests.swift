//
//  AccountListViewModelTests.swift
//  Veryable SampleTests
//
//  Created by Mahender Reddy Gaddam on 4/5/22.
//  Copyright © 2022 Veryable Inc. All rights reserved.
//

import XCTest
@testable import Veryable_Sample

class AccountListViewModelTests: XCTestCase {
    var accountListViewModel: AccountListViewModelProtocol!
    let accoutRepoMock = AccountRepoMock()
    
    override func setUpWithError() throws {
        accountListViewModel = AccountListViewModel(repo: accoutRepoMock)
    }

    override func tearDownWithError() throws {
        accountListViewModel = nil
    }

    func testGetAccountListWhenSuccess() throws {
        let exceptn = expectation(description: "Should get account list")
        accountListViewModel.getAccountList { isError in
            XCTAssertFalse(isError)
            exceptn.fulfill()
        }
        waitForExpectations(timeout: 0.1, handler: nil)
    }
    
    func testGetAccountListWhenFailed() throws {
        let exceptn = expectation(description: "Should not get account list")
        accoutRepoMock.shouldFail = true
        accountListViewModel.getAccountList { isError in
            XCTAssertTrue(isError)
            exceptn.fulfill()
        }
        waitForExpectations(timeout: 0.1, handler: nil)
    }
    
    func testNumberOfSectionsShouldReturnTwo() {
        accountListViewModel.getAccountList(completion: { isError in })
        XCTAssertEqual(accountListViewModel.numberOfSections(), 2)
    }
    
    func testNumberOfRowsInSectionOneShouldReturnOne() {
        accountListViewModel.getAccountList(completion: { isError in })
        XCTAssertEqual(accountListViewModel.numberOfRowsInSection(section: 0), 1)
    }
    
    func testTitleForSectionShouldReturnCards() {
        accountListViewModel.getAccountList(completion: { isError in })
        XCTAssertEqual(accountListViewModel.titleForSection(section: 1), "Cards")
    }
    
    func testAccountForRowAtIndexPathShouldReturnBankType() {
        accountListViewModel.getAccountList(completion: { isError in })
        XCTAssertEqual(accountListViewModel.accountForRowAtIndexPath(indexPath: IndexPath(row: 0, section: 0))?.accountType, "bank")
    }
}
