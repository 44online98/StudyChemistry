//
//  LabelTableViewCell.swift
//  PAVietNam
//
//  Created by SSN on 4/4/18.
//  Copyright © 2018 SSN. All rights reserved.
//

import UIKit

class LabelTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconNextImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        iconImageView.image = UIImage.init(named: "icon_account")
        iconImageView.frame = CGRect.init(x: kMargin*2, y: kMargin, width: 28, height: 28)
        
        titleLabel.frame = CGRect.init(x: iconImageView.right + kMargin*2, y: 0, width: self.width - 28*2 - kMargin*4 , height: self.height)
        
        iconNextImageView.image = UIImage.init(named: "icon_arow")
        iconNextImageView.frame = CGRect.init(x: self.width - 28, y: kMargin, width: 28, height: 28)
    }
    
    func adjustView(title: String) {
        titleLabel.text = title
    }
}
