//
//  AccountListViewController.swift
//  Veryable Sample
//
//  Created by Isaac Sheets on 5/27/21.
//  Copyright © 2021 Veryable Inc. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class AccountListViewController: UIViewController {
    private var tableView = UITableView(frame: .zero, style: .grouped)
    private var accountListViewModel: AccountListViewModelProtocol?
    
    //MARK: Inits
    init(viewModel: AccountListViewModelProtocol, screenTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = screenTitle.uppercased()
        accountListViewModel = viewModel
    }
    
    required init?(coder: NSCoder) { nil }

    //MARK: Overrides
    override func viewDidLoad() {
        navigationItem.backButtonTitle = ""
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font:  UIFont.vryAvenirNextRegular(18)]
        setupTableView()
        getAccountListData()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(view)
        }
    }
    
    // MARK: Fetch Data Methods
    func getAccountListData() {
        accountListViewModel?.getAccountList { [weak self] isError in
            if isError {
                let alert = UIAlertController(title: "Error", message: "Failed to retrieve accounts data", preferredStyle: .alert)
                alert.addAction(.init(title: "OK", style: .cancel, handler: nil))
                self?.present(alert, animated: true, completion: nil)
            } else {
                self?.tableView.reloadData()
            }
        }
    }
}

extension AccountListViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: UITableViewDelegate Methods

    func numberOfSections(in tableView: UITableView) -> Int {
        return accountListViewModel?.numberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UITableViewHeaderFooterView()
        headerView.contentView.backgroundColor = VGrey.disabled.color
        
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = accountListViewModel?.titleForSection(section: section)
        label.textColor = VGrey.dark.color
        label.font = .vryAvenirNextDemiBold(16)
        headerView.addSubview(label)
        
        label.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(headerView).inset(UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let account = accountListViewModel?.accountForRowAtIndexPath(indexPath: indexPath)
        let accountDetailViewController = AccountDetailViewController(viewModel: AccountDetailViewModel(account: account), screenTitle: "Details")
        self.navigationController?.pushViewController(accountDetailViewController, animated: true)
    }

    // MARK: UITableViewDataSource Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountListViewModel?.numberOfRowsInSection(section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let account = accountListViewModel?.accountForRowAtIndexPath(indexPath: indexPath)
        let cellIdentifier = "AccountInfoTableViewCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? AccountInfoTableViewCell
        if cell == nil {
            cell = AccountInfoTableViewCell(style: .default, reuseIdentifier: cellIdentifier)
            cell?.configureData(account: account)
        } else {
            cell?.configureData(account: account)
        }
        return cell!
    }
}
