//
//  PurchaseTableViewCell.swift
//  MyTable3Weeks
//
//  Created by bro on 2022/05/03.
//

import UIKit

class PurchaseTableViewCell: UITableViewCell {

    @IBOutlet weak var shoppingTextField: UITextField!
    
    @IBOutlet weak var purchaseBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
