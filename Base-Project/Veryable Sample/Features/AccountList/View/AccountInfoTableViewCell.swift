//
//  AccountInfoTableViewCell.swift
//  Veryable Sample
//
//  Created by Mahender Reddy Gaddam on 4/3/22.
//  Copyright © 2022 Veryable Inc. All rights reserved.
//

import UIKit

class AccountInfoTableViewCell: UITableViewCell {
    let accountImageView = UIImageView()
    let accountNameLabel = UILabel()
    let transferTimeLabel = UILabel()
    let accountDescriptionLabel = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        selectionStyle = .none
        accessoryType = .disclosureIndicator;
        
        contentView.addSubview(accountImageView)

        accountNameLabel.textColor = VGrey.dark.color
        accountNameLabel.font = .vryAvenirNextDemiBold(14)
        contentView.addSubview(accountNameLabel)

        accountDescriptionLabel.textColor = VGrey.dark.color
        accountDescriptionLabel.font = .vryAvenirNextRegular(12)
        contentView.addSubview(accountDescriptionLabel)

        transferTimeLabel.textColor = VGrey.normal.color
        transferTimeLabel.font = .vryAvenirNextRegular(12)
        contentView.addSubview(transferTimeLabel)
    }
    
    func setupConstraints() {
        accountImageView.snp.makeConstraints { (make) -> Void in
            make.size.equalTo(CGSize(width: 25, height: 25))
            make.leading.equalTo(contentView).offset(16)
            make.top.equalTo(contentView).offset(10)
        }

        accountNameLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(contentView).offset(8)
            make.left.equalTo(accountImageView.snp.right).offset(16)
            make.trailing.equalTo(contentView).offset(-16)
        }

        accountDescriptionLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(accountNameLabel.snp.bottom).offset(4)
            make.leading.equalTo(accountNameLabel)
            make.trailing.equalTo(accountNameLabel)
        }

        transferTimeLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(accountDescriptionLabel.snp.bottom).offset(4)
            make.leading.equalTo(accountDescriptionLabel)
            make.trailing.equalTo(accountDescriptionLabel)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
        }
    }
    
    func configureData(account: Account?) {
        accountImageView.image = .init(imageLiteralResourceName: account!.accountType).withTintColor(VBlue.dark.color)
        accountNameLabel.text = account?.accountName
        accountDescriptionLabel.text = account?.description
        if account?.accountType == "bank" {
            transferTimeLabel.text = "Bank Account: ACH - Same Day"
        } else {
            transferTimeLabel.text = "Card: Instant"
        }
    }
}
