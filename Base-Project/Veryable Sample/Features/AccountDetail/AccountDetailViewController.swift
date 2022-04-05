//
//  AccountDetailViewController.swift
//  Veryable Sample
//
//  Created by Mahender Reddy Gaddam on 4/2/22.
//  Copyright © 2022 Veryable Inc. All rights reserved.
//

import UIKit

class AccountDetailViewController: UIViewController {
    
    //MARK: Views
    let contentView = UIView()
    let imageView = UIImageView()
    let accountNameLabel = UILabel()
    let accountDescriptionLabel = UILabel()
    let doneButton = UIButton()
    
    //MARK: Private properties
    private var accountDetailViewModel: AccountDetailViewModelProtocol?
    
    //MARK: Inits
    init(viewModel: AccountDetailViewModelProtocol, screenTitle: String) {
        super.init(nibName: nil, bundle: nil)
        self.title = screenTitle.uppercased()
        accountDetailViewModel = viewModel
    }
    
    required init?(coder: NSCoder) { nil }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.tintColor = VGrey.dark.color
        
        setupViews()
        setupConstraints()
        displayData()
    }
    
    func setupViews() {
        contentView.backgroundColor = VGrey.disabled.color
        view.addSubview(contentView)
        contentView.addSubview(imageView)
        
        accountNameLabel.textColor = VGrey.dark.color
        accountNameLabel.font = .vryAvenirNextDemiBold(16)
        view.addSubview(accountNameLabel)
        
        accountDescriptionLabel.textColor = VGrey.normal.color
        accountDescriptionLabel.font = .vryAvenirNextRegular(14)
        view.addSubview(accountDescriptionLabel)
        
        doneButton.setTitle("DONE", for: .normal)
        doneButton.tintColor = .white
        doneButton.titleLabel?.font = .vryAvenirNextDemiBold(18)
        doneButton.backgroundColor = VBlue.dark.color
        doneButton.layer.cornerRadius = 4
        view.addSubview(doneButton)
        
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
    }
    
    func setupConstraints() {
        contentView.snp.makeConstraints { make in
            make.left.top.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view)
        }
        
        imageView.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 100, height: 100))
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.centerX.equalTo(view)
        }
        
        accountNameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(16)
            make.centerX.equalTo(imageView)
        }
        
        accountDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(accountNameLabel.snp.bottom).offset(8)
            make.centerX.equalTo(accountNameLabel)
        }
        
        doneButton.snp.makeConstraints { make in
            make.height.equalTo(45)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-16)
            make.leading.equalTo(view).offset(16)
            make.trailing.equalTo(view).offset(-16)
        }
    }
    
    func displayData() {
        imageView.image = .init(imageLiteralResourceName: accountDetailViewModel?.imageName ?? "").withTintColor(VBlue.dark.color)
        accountNameLabel.text = accountDetailViewModel?.accountName
        accountDescriptionLabel.text = accountDetailViewModel?.description
    }
        
    @objc func doneButtonTapped(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
     }
}
