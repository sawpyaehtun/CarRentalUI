//
//  CarItemTableViewCell.swift
//  iOSUITest
//
//  Created by Tamron iMac 001 on 7/3/21.
//

import UIKit

class CarItemTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
