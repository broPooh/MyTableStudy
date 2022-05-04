//
//  ShoppingTableViewCell.swift
//  MyTable3Weeks
//
//  Created by bro on 2022/05/03.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {

    @IBOutlet weak var checkBtn: UIButton!
    @IBOutlet weak var shoppingLabel: UILabel!
    @IBOutlet weak var starBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
