//
//  AccountRepo.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation
import Alamofire

let accountListUrl = "https://veryable-public-assets.s3.us-east-2.amazonaws.com/veryable.json"

protocol AccountRepoProtocol {
    func getAccountList(completionHandler: @escaping ([Account]?, Bool) -> Void)
}

class AccountRepo: AccountRepoProtocol {
    public func getAccountList(completionHandler: @escaping ([Account]?, Bool) -> Void) {
        let request = AF.request(accountListUrl)
        request.responseDecodable(of: [Account].self) { response in
            switch(response.result) {
            case .success(let value):
                completionHandler(value, false)
            case .failure(_):
                completionHandler(nil, true)
            }
        }
    }
}
