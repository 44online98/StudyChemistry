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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        // iconImageView
        iconImageView.frame = CGRect.init(x: MARGIN*2, y: MARGIN, width: SIZE_BUTTON, height: SIZE_BUTTON)
        // titleLabel
        titleLabel.frame = CGRect.init(x: iconImageView.right + MARGIN*2, y: 0, width: self.width - SIZE_BUTTON - MARGIN*4 - 34, height: self.height)
    }
    
    func adjustView(image: String, title: String) {
        iconImageView.image = UIImage.init(named: image)
        titleLabel.text = title
    }
}
