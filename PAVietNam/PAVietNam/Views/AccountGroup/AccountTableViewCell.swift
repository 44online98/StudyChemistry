//
//  AccountTableViewCell.swift
//  PAVietNam
//
//  Created by SSN on 4/17/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {
    @IBOutlet weak var imageAccount: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        //
        imageAccount.frame = CGRect.init(x: 3*MARGIN/2, y: 3*MARGIN/2, width: self.height - MARGIN*3, height: self.height - MARGIN*3)
        imageAccount.setImageForName(string: "PA-192934", backgroundColor: .lightGray,
                                     circular: true, gradient: true)
        //
        nameLabel.frame = CGRect.init(x: self.height, y: MARGIN,
                                           width: self.width - self.height - 34, height: nameLabel.height)
        //
        moneyLabel.frame = CGRect.init(x: nameLabel.left , y: nameLabel.bottom + MARGIN,
                                           width: nameLabel.width, height: moneyLabel.height)
    }
    
    func adjustView(name: String, money: String) {
        
    }
    
}
