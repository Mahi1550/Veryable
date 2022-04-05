//
//  AccountListViewModel.swift
//  Veryable Sample
//
//  Created by Mahender Reddy Gaddam on 4/3/22.
//  Copyright © 2022 Veryable Inc. All rights reserved.
//

import Foundation

protocol AccountListViewModelProtocol {
    func numberOfSections() -> Int
    func numberOfRowsInSection(section: Int) -> Int
    func titleForSection(section: Int) -> String
    func accountForRowAtIndexPath(indexPath: IndexPath) -> Account?
    
    func getAccountList(completion: @escaping (Bool) -> Void)
}

class AccountListViewModel: AccountListViewModelProtocol {
    private var accountsByType: [String: [Account]] = [:]
    private var accountTypes: [String] = []
    private var accountRepo: AccountRepoProtocol
    
    init(repo: AccountRepoProtocol) {
        accountRepo = repo
    }
    
    func numberOfSections() -> Int {
        return accountsByType.count
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        return accountsByType[accountTypes[section]]?.count ?? 0
    }
    
    func titleForSection(section: Int) -> String {
        return accountTypes[section]
    }
    
    func accountForRowAtIndexPath(indexPath: IndexPath) -> Account? {
        return accountsByType[accountTypes[indexPath.section]]?[indexPath.row]
    }
    
    func getAccountList(completion: @escaping (Bool) -> Void) {
        accountRepo.getAccountList { accounts, isError in
            if let accounts = accounts, isError == false {
                self.accountsByType = Dictionary(grouping: accounts, by: { account in
                    if account.accountType == "bank" {
                        return "Bank Accounts"
                    }
                    return "Cards"
                })
                self.accountTypes = self.accountsByType.keys.sorted()
            }
            completion(isError)
        }
    }
}
