//
//  AccountsTableViewCell.swift
//  Acoounts_For_ING
//
//  Created by sabina on 23/01/17.
//  Copyright © 2017 sabina. All rights reserved.
//

import UIKit


class AccountTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var accountName: UILabel!
    
    @IBOutlet weak var accountImage: UIImageView!
    @IBOutlet weak var accountBalance: UILabel!
    @IBOutlet weak var accountIban: UILabel!
    
    var account: Account! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI()
    {
      accountName.text = account.accountName
      accountBalance.text = String(describing: account.accountBalanceInCents )
      accountIban.text = String(account.accountNumber)
     accountImage.image = UIImage(named: "ic_list_visa")
    }
    

}
